# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create!(title:"First product", description: %{cekgwefvfevwfvwefbhdbkhbnbnfbnzdbfnzdbfnzdbfnzbdmfbzdnbfnzdbfnzdzdbnzbfndvndnkdbvbdkvs},image_url:'3.png',price: 12.32,rating:3,company: "bfiebf",tags:"rails",category: "Product")
Product.create!(title:"Second product", description: %{cekgwefvfevwfvwefbhdbkhbnbnfbnzdbfnzdbfnzdbfnzbdmfbzdnbfnzdbfnzdzdbnzbfndvndnkdbvbdkvs},image_url:'3.png',price: 52.32,rating:3,company: "bfiewefebf",tags:"rails",category: "Product")
Product.create!(title:"Third product", description: %{cekgwefvfevwfvwefbhdbkhbnbnfbnzdbfnzdbfnzdbfnzbdmfbzdnbfnzdbfnzdzdbnzbfndvndnkdbvbdkvs},image_url:'3.png',price: 22.32,rating:3,company: "bfigwgeebf",tags:"rails",category: "Product")
User.create!(name:  "Example User",
             email: "admin@admin.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
