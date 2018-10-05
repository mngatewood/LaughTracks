require_relative '../models/comedian.rb'
require_relative '../models/special.rb'
require 'date'

class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
      @average_age = @comedians.average_age
      # average_runtime does not use ActiveRecord
      all_runtimes = @comedians.map{|c|c.specials.map{|s|s.runtime}}.flatten
      @average_runtime = all_runtimes.sum / all_runtimes.count
      @unique_cities = @comedians.unique_cities
    else
      @comedians = Comedian.all
      @average_age = Comedian.average_age
      @average_runtime = Special.average_runtime
      @unique_cities = Comedian.unique_cities
    end
    @specials_count = @comedians.map{|c|c.specials.count}.sum
    @today = Date.today
    erb :index
  end

  get '/comedians/new' do
    erb :new
  end

  post '/comedians' do
    comedian = Comedian.create(params[:comedian])
    redirect :comedians
  end

end
