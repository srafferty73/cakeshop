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
  # Go to the database and retreive all the orders
  @orders = Cake.all
  # Display a list of all the orders
  erb( :index )
end

# NEW


# CREATE
# SHOW
# EDIT
# UPDATE
# DELETE
