class Special < ActiveRecord::Base

  validates_presence_of :title, :comedian_id

  belongs_to :comedian

end
