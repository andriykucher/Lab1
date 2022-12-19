
require_relative 'cart.rb'
require_relative 'parser.rb'

class MainApplication
	parser = Parser.new
	data = parser.parse_items('https://rozetka.com.ua/ua/mobile-phones/c80003/')
	cart = Cart.new
	cart.save_to_json("output.json", data)
	cart.save_to_cvs("output.csv", data)
end
