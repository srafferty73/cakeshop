require_relative( "../db/sql_runner" )

class Manufacturer

  attr_reader :id
  attr_accessor :name, :location, :manager_name, :minimum_order

  def initialize( options)
    @id = options['id'].to_i if options['id']
    @name = options['name'] #greggs, baynes, stephens etc...
    @location = options['location'] # edinburgh, glasgow, dundee etc...
    @manager_name = options['manager_name']
    @minimum_order = options['minimum_order'].to_i
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      name,
      location,
      manager_name,
      minimum_order
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @location, @manager_name, @minimum_order]
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

  def self.find(id)
    sql = "
      SELECT * FROM manufacturers
      WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    manufacturer = Manufacturer.new(result)
    return manufacturer
  end

  def self.filter()
    sql = "
      SELECT * FROM cakes
      WHERE manufacturer_id = manufacturer.id
      ORDER BY id ASC"
    cakes = SqlRunner.run( sql )
    result = cakes.map { |cake| Cake.new( cake ) }
    return result
  end

end
