require "http"

all_products_response = HTTP.get("http://localhost:3000/all_products.json")
all_products = all_products_response.parse

one_product_response = HTTP.get("http://localhost:3000/one_product.json")
one_product = one_product_response.parse

puts "Select an option to continue: [1] One Product, [2] All Products"
input_selection = gets.chomp

if input_selection == "1"
  print "Enter product ID:"
  id_selection = gets.chomp.to_i
  pp one_product
elsif input_selection == "2"
  pp all_products
end
