class Item

  def initialize (code, name, price)
    @code = code
    @name = name
    @price = price
  end

  def code= code
    @code = code
  end

  def name= name
    @name = name
  end

  def price= price
    @price = price
  end

  def to_hash()
    return {
      code: @code,
      name: @name,
      price: @price
    }
  end
end
