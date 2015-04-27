require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  erb(:index)
end

get('/results') do

  erb(:results)
end
