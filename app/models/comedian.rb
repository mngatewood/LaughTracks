require 'pry'

class Comedian < ActiveRecord::Base

  validates_presence_of :name, :birthdate, :city

  has_many :specials

  def self.average_age
    sum_of_ages = Comedian.all.sum{|c|(Time.now - c.birthdate.to_time) / 1.year.seconds}
    return (sum_of_ages / Comedian.all.length).floor
  end

  def self.unique_cities
    Comedian.distinct.pluck(:city)
  end

end
