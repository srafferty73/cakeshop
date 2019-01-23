require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative("./controllers/cakes_controller")
require_relative("./controllers/manufacturers_controller")
also_reload("./models/*")


get '/' do
  erb( :home )
end
