require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../db/sql_runner')
require_relative("../models/manufacturer")

also_reload( '../models/*' )
