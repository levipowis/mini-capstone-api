# Supplier.create!([
#   {name: "Roc Books", email: "roc_books@test.com", phone_number: "888-555-4222"},
#   {name: "Houghton Mifflin", email: "hm@test.com", phone_number: "888-555-4234"},
#   {name: "Doubleday", email: "doubleday@test.com", phone_number: "888-555-1233"},
#   {name: "Random House", email: "randomhouse@test.com", phone_number: "888-555-2445"}
# ])
# Product.create!([
#   {name: "Changes", price: "25.0", image_url: "https://m.media-amazon.com/images/I/41Wy6us8heL._SY445_SX342_.jpg", description: "The 12th book in the Dresden Files series by Jim Butcher.", inventory: nil, supplier_id: 1},
#   {name: "Lord of the Rings", price: "19.0", image_url: "https://m.media-amazon.com/images/I/51kfFS5-fnL._SY445_SX342_.jpg", description: "One volume of Lord of the Rings by JRR Tolkien", inventory: nil, supplier_id: 2},
#   {name: "The Hobbit", price: "15.0", image_url: "https://m.media-amazon.com/images/I/51uYlDqoIyL._SY445_SX342_.jpg", description: "The Hobbit by JRR Tolkien", inventory: nil, supplier_id: 2},
#   {name: "Path of Destruction", price: "18.0", image_url: "https://m.media-amazon.com/images/I/51o9DAeSvrL._SY445_SX342_.jpg", description: "First in the Darth Bane trilogy.", inventory: nil, supplier_id: 4},
#   {name: "The Rule of Two", price: "15.0", image_url: "https://m.media-amazon.com/images/I/51uVoC-gAZL._SY445_SX342_.jpg", description: "The second novel in the Darth Bane trilogy.", inventory: nil, supplier_id: 4},
#   {name: "The Stand", price: "10.0", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/The_Stand_%281978%29_front_cover%2C_first_edition.png/440px-The_Stand_%281978%29_front_cover%2C_first_edition.png", description: "Classic end of the world novel by Stephen King.", inventory: nil, supplier_id: 3}
# ])

# Image.create!(url: "https://m.media-amazon.com/images/I/41Wy6us8heL._SY445_SX342_.jpg", product_id: 4)
# Image.create!(url: "https://m.media-amazon.com/images/I/91tl+39MjEL._SX679_.jpg", product_id: 4)

Image.create!(url: "https://m.media-amazon.com/images/I/51vRFvKZMXL._SY445_SX342_.jpg", product_id: 6)
Image.create!(url: "https://m.media-amazon.com/images/I/51uVoC-gAZL._SY466_.jpg", product_id: 8)
Image.create!(url: "https://m.media-amazon.com/images/I/41r0b4e7RfL._SY445_SX342_.jpg", product_id: 10)
Image.create!(url: "https://m.media-amazon.com/images/I/8195LaJUCSL._SY466_.jpg", product_id: 11)
