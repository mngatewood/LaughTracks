require_relative '../models/comedian.rb'
require_relative '../models/special.rb'
require 'date'

class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.all
    @today = Date.today
    @average_age = Comedian.average_age
    @unique_cities = Comedian.unique_cities
    @average_runtime = Special.average_runtime
    erb :index
  end

end
