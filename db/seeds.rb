require_relative("../models/cake")
require_relative("../models/manufacturer")
require("pry-byebug")

Cake.delete_all()
Manufacturer.delete_all()

#Always ensure that "buying_cost" < "selling_price" to ensure profit

# ------ CAKES ------

cake1 = Cake.new ({
  "name" => "Chocolate", "category" => "birthday",
  "quantity" => 3, "buying_cost" => 5, "selling_price" => 7})
cake1.save()

cake2 = Cake.new ({
  "name" => "Gateau", "category" => "celebration", "quantity" => 1,
  "buying_cost" => 7, "selling_price" => 10})
cake2.save()

cake3 = Cake.new ({
  "name" => "3-Tier", "category" => "wedding", "quantity" => 2,
  "buying_cost" => 15, "selling_price" => 20})
cake3.save()

cake4 = Cake.new ({
  "name" => "Butterbeer", "category" => "cupcake", "quantity" => 5,
  "buying_cost" => 2, "selling_price" => 3})
cake4.save()

cake5 = Cake.new ({
  "name" => "Red Velvet", "category" => "birthday", "quantity" => 2,
  "buying_cost" => 7, "selling_price" => 11})
cake5.save()

# --- MANUFACTURERS ---

manufacturer1 = Manufacturer.new({
  "name" => "Earthquake Cakes", "location" => "dundee",
  "delivery_fee" => 20, "minimum_order" => 5})
manufacturer1.save()

manufacturer2 = Manufacturer.new({
  "name" => "Reekin' Pecans ", "location" => "glasgow",
  "delivery_fee" => 17, "minimum_order" => 6})
manufacturer2.save()

manufacturer3 = Manufacturer.new({
  "name" => "Flustered Custard", "location" => "edinburgh",
  "delivery_fee" => 12, "minimum_order" => 3})
manufacturer3.save()

manufacturer4 = Manufacturer.new({
  "name" => "Sugar Boogers", "location" => "edinburgh",
  "delivery_fee" => 14, "minimum_order" => 2})
manufacturer4.save()
