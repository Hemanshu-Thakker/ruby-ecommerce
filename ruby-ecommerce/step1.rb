require 'pry'
require "#{ARGV[0]}/model.rb"

$warehouse = Hash.new # Globall Hash

###########################################################################################################
p "TEST CASE 1 - all positive"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 50}), 100) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 500.00}) # User model object created

response = buyer1.add_to_cart(dove_soap, 5) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # Product successfully added to cart

response = buyer1.buy # Cart products are bought and cart is emptied
p response # Product successfully purchased. Happy Shopping !
puts


###########################################################################################################
p "TEST CASE 2 - product failed to append in cart due to availability"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 50}), 0) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 0}) # User model object created

response = buyer1.add_to_cart(dove_soap, 5) # Add product to cart. Note: Since DB is not used product is passed as an object and not PK
p response # 5 products cannot be added to cart. Try again later

response = buyer1.buy # Cart products are bought and cart is emptied
p response # No products available in cart
puts


###########################################################################################################
p "TEST CASE 3 - product purchase failed due to insufficient balance"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 50}), 100) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 210.99}) # User model object created

response = buyer1.add_to_cart(dove_soap, 5) # Add product to cart. Note: Since DB is not used product is passed as an object and not PK 
p response # Product successfully added to cart

response = buyer1.buy # Cart products are bought and cart is emptied
p response # Purchase failed due to insufficient balance
puts


###########################################################################################################
p "TEST CASE 4 - invalid parameter passed as quantity to add in cart" 
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 50}), 100) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 500.99}) # User model object created

response = buyer1.add_to_cart(dove_soap, -5) # Add product to cart. Note: Since DB is not used product is passed as an object and not PK 
p response # Invalid quantity exception !!!

response = buyer1.buy # Cart products are bought and cart is emptied
p response # No products available in cart