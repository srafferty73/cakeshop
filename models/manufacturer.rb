require_relative( "../db/sql_runner" )

class Manufacturer

  attr_reader :id
  attr_accessor :name, :location, :delivery_fee, :minimum_order

  def initialize( options)
    @id = options['id'].to_i if options['id']
    @name = options['name'] #greggs, baynes, stephens etc...
    @location = options['location'] # edinburgh, glasgow, dundee etc...
    @delivery_fee = options['delivery_fee'].to_i
    @minimum_order = options['minimum_order'].to_i
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

  def self.all()
    sql = "SELECT * FROM manufacturers"
    bakeries = SqlRunner.run( sql )
    result = bakeries.map { |bakery| Manufacturer.new( bakery ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

end
