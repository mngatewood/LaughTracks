require_relative '../models/comedian.rb'
require_relative '../models/special.rb'

class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.all
    erb :index
  end

end
