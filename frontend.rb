require "http"

all_products_response = HTTP.get("http://localhost:3000/all_products.json")
all_products = all_products_response.parse

one_product_response = HTTP.get("http://localhost:3000/one_product.json")
one_product = one_product_response.parse

another_product_response = HTTP.get("http://localhost:3000/another_product.json")
another_product = another_product_response.parse

puts "Select an option to continue: [A]ll Products, [1] One Product, [2] Another Product"
input_selection = gets.chomp

if input_selection == "A" || input_selection == "a"
  pp all_products
elsif input_selection == "1"
  pp one_product
elsif input_selection == "2"
  pp another_product
end
