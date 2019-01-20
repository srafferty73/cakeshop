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
  # Go to the database and retrieve all the orders & manufacturers
    @bakeries = Manufacturer.all
    @orders = Cake.all
  # Display a list of all the orders and manufacturers
  erb( :index )
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
