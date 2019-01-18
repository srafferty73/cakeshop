require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative("./models/cake")
require_relative("./models/manufacturer")
also_reload("./models/*")

get '/' do
  erb( :index )
end

# INDEX
# NEW
# CREATE
# SHOW
# EDIT
# UPDATE
# DELETE
