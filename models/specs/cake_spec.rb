require("minitest/autorun")
require_relative("../cake")

class TestCake < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Testcake", "category" => "wedding",
      "quantity" => 2, "buying_cost" => 5, "selling_price" => 7}

    @order = Cake.new(options)
  end

  def test_name()
    result = @order.name()
    assert_equal("Testcake", result)
  end

  def test_category()
    result = @order.category()
    assert_equal("wedding", result)
  end

  def test_quantity()
    result = @order.quantity()
    assert_equal(2, result)
  end

  def test_buying_cost()
    result = @order.buying_cost()
    assert_equal(5, result)
  end

  def test_selling_price()
    result = @order.selling_price()
    assert_equal(7, result)
  end
end
