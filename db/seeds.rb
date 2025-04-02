# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

Author.create!(
  first_name: 'R D',
  last_name: 'Sharma',
  date_of_birth: '1950-03-01'
)

Author.create!(
  first_name: 'Deepika',
  last_name: 'Yadav',
  date_of_birth: '1985-05-10'
)

Author.create!(
  first_name: 'Shivendra',
  last_name: 'Prasad',
  date_of_birth: '1990-07-21'
)

Author.create!(
  first_name: 'Ankita',
  last_name: 'Jain',
  date_of_birth: '1993-11-15'
)
