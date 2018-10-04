require 'pry'

class Comedian < ActiveRecord::Base

  validates_presence_of :name, :age, :city

  has_many :specials

  def self.average_age
    Comedian.average(:age)
  end

  def self.unique_cities
    Comedian.distinct.pluck(:city)
  end

end
