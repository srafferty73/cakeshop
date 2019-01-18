require_relative( "../db/sql_runner" )

class Cake

  attr_reader :id
  attr_accessor :name, :category, :quantity, :buying_cost, :selling_price

  def initialize( options)
    @id = options['id'].to_i if options['id']
    @name = options['name'] #chocolate cake etc...
    @category = options['category'] # cupcake, birthday, wedding etc...
    @quantity = options['quantity']
    @buying_cost = options['buying_cost']
    @selling_price = options['selling_price']
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

end
