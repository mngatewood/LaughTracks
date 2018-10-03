class Comedian < ActiveRecord::Base

  validates_presence_of :name, :birthdate, :city

end
