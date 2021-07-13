class User
	# User has one Cart
	# User has many Products
	attr_accessor :name, :address, :contact, :balance, :shopping_cart, :order_history

	def initialize(params)
		@name = params[:name] # Primary Key
		@address = params[:address]
		@contact = params[:contact]
		@balance = params[:balance]
		@shopping_cart = create_cart_object
		@order_history = Hash.new
	end

	def create_cart_object
		Cart.new({checkout_price: 0})
	end

	def add_to_cart(product_key, quantity)
		if $warehouse.include?(product_key.name)
			if quantity <= $warehouse[product_key.name]
				begin
					raise "Invalid quantity exception !!!" unless quantity.is_a?(Integer) and quantity > 0
					# Business Logic
					self.shopping_cart.add_product_cart(product_key,quantity) # Add to cart
					WareHouse.subtract_product_warehouse(product_key.name,quantity) # Remove from warehouse
					self.shopping_cart.calculate_checkout_price # update checkout price
					"Product successfully added to cart"
				rescue Exception => e
					e.message
				end
			else
				"#{quantity} products unavailable. Try again later"
			end
		else
			"Product not present in warehouse"
		end
	end

	def buy
		unless self.shopping_cart.product_quantity_list.empty?
			if self.balance.to_i >= self.shopping_cart.checkout_price.to_i
				self.order_history = self.shopping_cart.product_quantity_list.clone # Add all the objects in order history
				self.shopping_cart.product_quantity_list.clear # clear cart 
				self.balance = self.balance.to_i - self.shopping_cart.checkout_price.to_i
				self.shopping_cart.checkout_price = 0
				"Product successfully purchased. Happy Shopping !"
			else
				"Purchase failed due to insufficient balance"
			end
		else
			"No products available in cart"
		end
	end
end

class Cart
	# Cart belongs to User
	# Cart has many Products
	attr_accessor :checkout_price, :product_quantity_list, :checkout_price_incl_tax

	def initialize(params)
		@checkout_price = params[:checkout_price]
		@checkout_price_incl_tax = 0
		@product_quantity_list = Hash.new
	end

	def add_product_cart(product_key,quantity)
		unless self.product_quantity_list[product_key].nil?
			self.product_quantity_list[product_key] = self.product_quantity_list[product_key] + quantity
		else
			self.product_quantity_list[product_key] = quantity
		end
	end

	def calculate_checkout_price
		sum = 0.00
		self.product_quantity_list.each do |k,v|
			sum = sum + (k.price.to_f * v.to_i)
		end
		self.checkout_price = sum.round(2)
		self.checkout_price_incl_tax = self.checkout_price + (self.checkout_price * (12.5/100)).round(2)
	end
end

class Product
	# Product belongs to Cart
	# Product belongs to User
	attr_accessor :name, :price
	
	def initialize(params)
		@name = params[:name] # Primary Key
		@price = params[:price]
	end
end

class WareHouse
	def self.add(product, quantity)
		$warehouse["#{product.name}"] = quantity
		return product
	end

	def self.display_products
		$warehouse.each do |key,val|
			# p "#{key} : #{val}"
		end
	end

	def self.subtract_product_warehouse(product_key,quantity)
		$warehouse[product_key] = $warehouse[product_key] - quantity
	end
end