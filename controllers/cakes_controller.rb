require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../db/sql_runner')
require_relative("../models/cake")

also_reload( '../models/*' )

# INDEX
get '/cake-inventory' do
  # Go to the database and retrieve all the orders
    @orders = Cake.all
  # Display a list of all the orders
  erb( :index )
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

get '/cake-orders/:id/edit-cake' do
  @order = Cake.find( params[:id] )
  erb( :edit )
end

# UPDATE
put '/cake-orders/:id' do # update
  Cake.new( params ).update
  redirect to '/cake-inventory'
end

# DELETE

get '/cake-orders/delete-cake' do
  erb( :delete)
end

post '/cake-orders/delete-cake' do
  cake = Cake.find(params['id'].to_i)
  cake.delete
  redirect to '/cake-inventory'
end
