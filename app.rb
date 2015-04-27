require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  erb(:index)
end

get('/results') do
  parcel = Parcel.new(params.fetch('length'), params.fetch('width'), params.fetch('height'), params.fetch('weight'))
  if params.has_key?('gift_wrap') == true
    parcel.gift_wrap(true)
  end
  @total_shipping_cost = parcel.cost_to_ship(params.fetch('priority'), params.fetch('destination'))
  erb(:results)
end
