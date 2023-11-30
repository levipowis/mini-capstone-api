require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Test", email: "test@test.com", password: "password", admin: true)
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "description", "is_discounted?", "tax", "total", "inventory", "supplier_id", "supplier", "images", "categories"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json",
        headers: { "Authorization" => "Bearer #{@jwt}" },
        params: { name: "test", price: 10, description: "test description", supplier_id: Supplier.first.id }
      assert_response 200
    end

    assert_difference "Product.count", 0 do
      post "/products.json",
        headers: { "Authorization" => "Bearer #{@jwt}" },
        params: {}
      assert_response 422
    end

    post "/products.json"
    assert_response 401
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json",
      headers: { "Authorization" => "Bearer #{@jwt}" },
      params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price.to_s, data["price"]
    assert_equal product.description, data["description"]
    assert_equal product.supplier_id, data["supplier_id"]

    patch "/products/#{product.id}.json",
      headers: { "Authorization" => "Bearer #{@jwt}" },
      params: { name: "" }
    assert_response 422

    patch "/products/#{product.id}.json"
    assert_response 401
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json",
        headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end

    delete "/products/#{Product.first.id}.json"
    assert_response 401
  end
end
