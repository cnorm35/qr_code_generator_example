class QrCode < ApplicationRecord
  require "mini_magick"

  has_one_attached :original_image
  has_one_attached :logo
  has_one_attached :combined_image

  def generate_qr_code!
    qr = RQRCode::QRCode.new(url)
    original_qr = qr.as_png(size: 400,
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white")
    original_image.attach(io: StringIO.new(original_qr.to_s), filename: "original_qr.png", content_type: "image/png")
    save!
  end

  def generate_combined_image!
    logo_image = MiniMagick::Image.open(logo)
    qr_code_image = MiniMagick::Image.open(original_image)

    updated_logo_image = ImageProcessing::MiniMagick.source(logo_image).resize_and_pad(100, 100, background: "white").call

    composite_qr_code = qr_code_image.composite(updated_logo_image) do |c|
      c.compose "Over"
      c.gravity "center"
      c.colorspace "sRGB"
    end

    combined_image.attach(filename: "combined_qr_code.png",
                          io: File.open(composite_qr_code.path),
                          content_type: "image/png")
    save!
  end
end
