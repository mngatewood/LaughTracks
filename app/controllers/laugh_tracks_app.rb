require_relative '../models/comedian.rb'
require_relative '../models/special.rb'
require 'date'

class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
      @average_age = Comedian.where(age: params[:age]).average_age
# filtering average_runtime breaks relationships
      @average_runtime = Special.average_runtime
      @unique_cities = Comedian.where(age: params[:age]).unique_cities
    else
      @comedians = Comedian.all
      @average_age = Comedian.average_age
      @average_runtime = Special.average_runtime
      @unique_cities = Comedian.unique_cities
    end
    @today = Date.today
    erb :index
  end

end
