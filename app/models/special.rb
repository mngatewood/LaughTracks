class Special < ActiveRecord::Base

  validates_presence_of :title, :comedian_id

  belongs_to :comedian

  def self.average_runtime
    average(:runtime) ? average(:runtime).floor : "N/A"
  end

end
