# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
qr_code = QrCode.new(url: "https://www.rubyonrails.org")
qr_code.logo.attach(io: File.open("app/assets/images/rails_logo.png"), filename: "rails_logo.png", content_type: "image/png")
qr_code.generate_qr_code!
qr_code.generate_combined_image!

