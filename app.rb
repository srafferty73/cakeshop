require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative("./models/cake")
require_relative("./models/manufacturer")
also_reload("./models/*")


get '/' do
  erb( :home )
end

# INDEX
get '/cake-inventory' do
  # Go to the database and retrieve all the orders
    @orders = Cake.all
  # Display a list of all the orders
  erb( :index )
end

# MANUFACTURER INDEX
get '/cake-orders/show-bakeries' do
  # Go to the database and retrieve all the manufacturers
    @bakeries = Manufacturer.all
  # Display a list of all the manufacturers
  erb( :manufacturer_index )
end

# NEW
get '/cake-orders/new' do
  erb( :new )
end

# CREATE

post '/cake-orders' do
  # Create a new Cake object
  Cake.new( params ).save
  # Save it to the DB
  # Redirect the browser to '/cake-inventory'
  redirect to '/cake-inventory'
end

# SHOW
# EDIT
# UPDATE
# DELETE

get '/cake-orders/delete-cake' do
  erb( :delete)
end

post '/cake-orders/delete-cake' do
  delete()
  redirect to '/cake-inventory'
end

def delete()
  sql = "DELETE FROM cakes
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end
