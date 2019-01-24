require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../db/sql_runner')
require_relative("../models/manufacturer")

also_reload( '../models/*' )

# FILTER
get '/cake-inventory-filter' do
  # Go to the database and retrieve all the orders
    @manufacturers = Manufacturer.all
  # Display a list of all the orders
  erb( :filter )
end

# MANUFACTURER INDEX
get '/cake-orders/show-bakeries' do
  # Go to the database and retrieve all the manufacturers
    @bakeries = Manufacturer.all
  # Display a list of all the manufacturers
  erb( :manufacturer_index )
end

# post '/cake-orders/show-bakeries' do
#   Manufacturer.new( params ).save
#   redirect to '/cake-orders/show-bakeries'
# end
