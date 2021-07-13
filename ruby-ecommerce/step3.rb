require 'pry'
require "#{ARGV[0]}/model.rb"

$warehouse = Hash.new # Globall Hash

###########################################################################################################
p "TEST CASE 1 - all positive"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 39.99}), 100) # Parameters = Product Object and Parameters
axe_deo = WareHouse.add(Product.new({name: "Axe Deo", price: 99.99}), 100) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 500.00}) # User model object created

response = buyer1.add_to_cart(dove_soap, 2) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # Product successfully added to cart
response = buyer1.add_to_cart(axe_deo, 2) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # Product successfully added to cart
p (buyer1.shopping_cart.checkout_price_incl_tax.to_f - buyer1.shopping_cart.checkout_price.to_f).to_s + " is the sales tax for the products in cart"
p buyer1.shopping_cart.checkout_price_incl_tax.to_s + " is the checkout price including sales tax"
puts

###########################################################################################################
p "TEST CASE 2 - soap added to cart and not axe deo"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 39.99}), 100) # Parameters = Product Object and Parameters
axe_deo = WareHouse.add(Product.new({name: "Axe Deo", price: 99.99}), 1) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 500.00}) # User model object created

response = buyer1.add_to_cart(dove_soap, 2) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # Product successfully added to cart
response = buyer1.add_to_cart(axe_deo, 2) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # 2 products cannot be added to cart. Try again later
p (buyer1.shopping_cart.checkout_price_incl_tax.to_f - buyer1.shopping_cart.checkout_price.to_f).to_s + " is the sales tax for the products in cart"
p buyer1.shopping_cart.checkout_price_incl_tax.to_s + " is the checkout price including sales tax"
puts

###########################################################################################################
p "TEST CASE 3 - axe deo added to cart and not dove soap"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 39.99}), 1) # Parameters = Product Object and Parameters
axe_deo = WareHouse.add(Product.new({name: "Axe Deo", price: 99.99}), 100) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 500.00}) # User model object created

response = buyer1.add_to_cart(dove_soap, 2) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # 2 products cannot be added to cart. Try again later
response = buyer1.add_to_cart(axe_deo, 2) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # Product successfully added to cart
p (buyer1.shopping_cart.checkout_price_incl_tax.to_f - buyer1.shopping_cart.checkout_price.to_f).to_s + " is the sales tax for the products in cart"
p buyer1.shopping_cart.checkout_price_incl_tax.to_s + " is the checkout price including sales tax"
puts

###########################################################################################################
p "TEST CASE 3 - no products added to cart"
###########################################################################################################
dove_soap = WareHouse.add(Product.new({name: "Dove Soap", price: 39.99}), 1) # Parameters = Product Object and Parameters
axe_deo = WareHouse.add(Product.new({name: "Axe Deo", price: 99.99}), 1) # Parameters = Product Object and Parameters

buyer1 = User.new({name: "Lessecureman", address: "Ooty", contact: "9999900000", balance: 500.00}) # User model object created

response = buyer1.add_to_cart(dove_soap, 2) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # 2 products cannot be added to cart. Try again later
response = buyer1.add_to_cart(axe_deo, 2) # Add product to cart.  Note: Since DB is not used product is passed as an object and not PK
p response # 2 products cannot be added to cart. Try again later
p (buyer1.shopping_cart.checkout_price_incl_tax.to_f - buyer1.shopping_cart.checkout_price.to_f).to_s + " is the sales tax for the products in cart"
p buyer1.shopping_cart.checkout_price_incl_tax.to_s + " is the checkout price including sales tax"