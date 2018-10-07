require_relative '../models/comedian.rb'
require_relative '../models/special.rb'
require 'date'

class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
      # average_runtime does not use ActiveRecord
      all_runtimes = @comedians.map{|c|c.specials.map{|s|s.runtime}}.flatten
      @average_runtime = all_runtimes.length > 0 ? all_runtimes.sum / all_runtimes.count : 0
      @unique_cities = @comedians.unique_cities
    else
      @comedians = params[:sort] ? Comedian.order(params[:sort]) : Comedian.all
      @average_runtime = Special.average_runtime
      @unique_cities = Comedian.unique_cities
    end
    @average_age = @comedians.average_age
    @specials_count = @comedians.map{|c|c.specials.count}.sum
    erb :index
  end

  get '/comedians/new' do
    erb :new
  end

  post '/comedians' do
    comedian = Comedian.create(params[:comedian])
    redirect :comedians
  end

  get '/comedians/:id' do
    @comedian = Comedian.find(params[:id])
    erb :show
  end

  get '/comedians/delete/:id' do
    comedian = Comedian.delete(params[:id])
    redirect :comedians
  end

end
