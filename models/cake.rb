require_relative( "../db/sql_runner" )

class Cake

  attr_reader :id
  attr_accessor :name, :category, :quantity, :buying_cost, :selling_price

  def initialize( options)
    @id = options['id'].to_i if options['id']
    @name = options['name'] #chocolate cake etc...
    @category = options['category'] # cupcake, birthday, wedding etc...
    @quantity = options['quantity'].to_i
    @buying_cost = options['buying_cost'].to_i
    @selling_price = options['selling_price'].to_i
  end

  def save()
    sql = "INSERT INTO cakes
    (
      name,
      category,
      quantity,
      buying_cost,
      selling_price
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @category, @quantity, @buying_cost, @selling_price]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
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
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@name, @category, @quantity, @buying_cost, @selling_price]
      SqlRunner.run(sql, values)
    end

  def self.all()
    sql = "SELECT * FROM cakes"
    cakes = SqlRunner.run( sql )
    result = cakes.map { |cake| Cake.new( cake ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM cakes"
    SqlRunner.run(sql)
  end

end
