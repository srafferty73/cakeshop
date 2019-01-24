require_relative( "../db/sql_runner" )

class Cake

  attr_reader :id
  attr_accessor :name, :category, :quantity, :buying_cost, :selling_price, :manufacturer_id

  def initialize( options)
    @id = options['id'].to_i if options['id']
    @name = options['name'] #chocolate cake etc...
    @category = options['category'] # cupcake, birthday, wedding etc...
    @quantity = options['quantity'].to_i
    @buying_cost = options['buying_cost'].to_i
    @selling_price = options['selling_price'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
  end

  def manufacturer()
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [@manufacturer_id]
    results = SqlRunner.run(sql, values)
    manufacturer_hash = results[0]
    manufacturer = Manufacturer.new(manufacturer_hash)
    return manufacturer
  end

  def save()
    sql = "INSERT INTO cakes
    (
      name,
      category,
      quantity,
      buying_cost,
      selling_price,
      manufacturer_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@name, @category, @quantity, @buying_cost, @selling_price, @manufacturer_id]
    results = SqlRunner.run(sql, values)
    id = results.first()['id'].to_i
    @id = id
  end

  def update()
    sql = "UPDATE cakes
    SET
    (
      name,
      category,
      quantity,
      buying_cost,
      selling_price,
      manufacturer_id
      ) =
      (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7"
      values = [@name, @category, @quantity, @buying_cost, @selling_price, @manufacturer_id, @id]
      SqlRunner.run(sql, values)
    end

  def self.all()
    sql = "
      SELECT * FROM cakes
      ORDER BY id ASC"
    cakes = SqlRunner.run( sql )
    result = cakes.map { |cake| Cake.new( cake ) }
    return result
  end

  def self.delete_all()
    sql = "
      DELETE FROM cakes"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
      DELETE FROM cakes
      WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "
      SELECT * FROM cakes
      WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    cake = Cake.new(result)
    return cake
  end

end
