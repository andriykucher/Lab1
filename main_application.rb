require_relative 'cart'

require_relative 'Rozetka\Mobile\mobile_phone_parser'

require_relative 'Rozetka\Kitchen\refrigerator_parser'

# A main entry point
class MainApplication
  parser = MobilePhoneParser.new

  data = parser.parse_items

  cart = Cart.new

  cart.save_to_json('Rozetka\Mobile\mobile_output.json', data)

  cart.save_to_cvs('Rozetka\Mobile\mobile_output.csv', data)

  parser = RefrigeratorParser.new

  data = parser.parse_items

  cart.save_to_json('Rozetka\Kitchen\refrigerator_output.json', data)

  cart.save_to_cvs('Rozetka\Kitchen\refrigerator_output.csv', data)
end
