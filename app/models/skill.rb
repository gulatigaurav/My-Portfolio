class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized


  after_initialize :set_defaults
 # all your model logic in model file
   def set_defaults
      self.badge ||= "http://via.placeholder.com/600x400"
   end

end
