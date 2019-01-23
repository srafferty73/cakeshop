require("minitest/autorun")
require_relative("../manufacturer")

class TestManufacturer < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Testman", "location" => "dundee",
      "manager_name" => "Bob Smith", "minimum_order" => 7}

    @bakery = Manufacturer.new(options)
  end

  def test_name()
    result = @bakery.name()
    assert_equal("Testman", result)
  end

  def test_location()
    result = @bakery.location()
    assert_equal("dundee", result)
  end

  def test_manager_name()
    result = @bakery.manager_name()
    assert_equal("Bob Smith", result)
  end

  def test_minimum_order()
    result = @bakery.minimum_order()
    assert_equal(7, result)
  end

end
