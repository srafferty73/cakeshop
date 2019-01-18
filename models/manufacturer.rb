require_relative( "../db/sql_runner" )

class Manufacturer

  attr_reader :id
  attr_accessor :name, :category, :quantity, :buying_cost, :selling_price

  def initialize( options)
    @id = options['id'].to_i if options['id']
    @name = options['name'] #greggs, baynes, stephens etc...
    @location = options['location'] # edinburgh, glasgow, dundee etc...
    @delivery_fee = options['delivery_fee']
    @minimum_order = options['minimum_order']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      name,
      location,
      delivery_fee,
      minimum_order
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @location, @delivery_fee, @minimum_order]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

end
