require_relative '../models/comedian.rb'
require_relative '../models/special.rb'
require 'date'

class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.all
    @today = Date.today
    erb :index
  end

end
