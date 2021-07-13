require "#{ARGV[0]}/model.rb"

$warehouse = Hash.new # Globall Hash

###########################################################################################################
p "TEST CASE 1 - all positive"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 39.99}), 100) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 500.00}) # User model object created

response = buyer1.add_to_cart(dove_soap, 5) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # Product successfully added to cart

response = buyer1.add_to_cart(dove_soap, 3) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # Product successfully added to cart
p buyer1.shopping_cart.checkout_price.to_s + " is the checkout price"
puts

###########################################################################################################
p "TEST CASE 2 - Only 5 products available in warehouse"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 39.99}), 5) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 500.00}) # User model object created

response = buyer1.add_to_cart(dove_soap, 5) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # Product successfully added to cart

response = buyer1.add_to_cart(dove_soap, 3) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # 3 products cannot be added to cart. Try again later
p buyer1.shopping_cart.checkout_price.to_s + " is the checkout price"
puts

###########################################################################################################
p "TEST CASE 3 - Only 3 products available in warehouse"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 39.99}), 3) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 500.00}) # User model object created

response = buyer1.add_to_cart(dove_soap, 5) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # 5 products cannot be added to cart. Try again later

response = buyer1.add_to_cart(dove_soap, 3) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # Product successfully added to cart
p buyer1.shopping_cart.checkout_price.to_s + " is the checkout price"
puts

###########################################################################################################
p "TEST CASE 4 - Only 1 product available in warehouse"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 39.99}), 1) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 500.00}) # User model object created

response = buyer1.add_to_cart(dove_soap, 5) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # 5 products cannot be added to cart. Try again later

response = buyer1.add_to_cart(dove_soap, 3) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # 3 products cannot be added to cart. Try again later
p buyer1.shopping_cart.checkout_price.to_s + " is the checkout price"