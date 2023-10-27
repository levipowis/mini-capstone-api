require "http"

puts "Select an option to continue: [1] View Product, [2] View All Products, [3] Create Product, [4] Update Product, [5] Destroy Product"
input_selection = gets.chomp

if input_selection == "1"
  print "Enter product ID:"
  id_selection = gets.chomp.to_i
  response = HTTP.get("http://localhost:3000/products/#{id_selection}.json")
  one_product = response.parse
  pp one_product
elsif input_selection == "2"
  response = HTTP.get("http://localhost:3000/products.json")
  products = response.parse
  pp products
elsif input_selection == "3"
  print "Name:"
  name = gets.chomp
  print "Price:"
  price = gets.chomp.to_i
  print "Image URL:"
  image_url = gets.chomp
  print "Description:"
  description = gets.chomp
  response = HTTP.post("http://localhost:3000/products.json", :json => {
                                                                :name => name,
                                                                :price => price,
                                                                :image_url => image_url,
                                                                :description => description,
                                                              })
  pp response.parse
elsif input_selection == "4"
  print "Enter product ID to udpate:"
  id_selection = gets.chomp.to_i
  # print "Name:"
  # name = gets.chomp
  print "Price:"
  price = gets.chomp.to_i
  # print "Image URL:"
  # image_url = gets.chomp
  # print "Description:"
  # description = gets.chomp
  response = HTTP.patch("http://localhost:3000/products/#{id_selection}.json", :json => {
                                                                                 :name => name,
                                                                                 :price => price,
                                                                                 :image_url => image_url,
                                                                                 :description => description,
                                                                               })
  pp response.parse
elsif input_selection == "5"
  print "Enter ID for product to DESTROY: "
  id_selection = gets.chomp
  response = HTTP.delete("http://localhost:3000/products/#{id_selection}.json")
  pp response.parse
end
