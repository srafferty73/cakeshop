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

# FILTER
get '/cake-inventory-filter' do
  # Go to the database and retrieve all the orders
    @orders = Cake.filter
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

# NEW
get '/cake-orders/new' do
  @manufacturers = Manufacturer.all
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

# post '/cake-orders/delete-cake' do
#   delete()
#   redirect to '/cake-inventory'
# end

post '/cake-orders/delete-cake' do
  cake = Cake.find(params['id'].to_i)
  cake.delete
  redirect to '/cake-inventory'
end
