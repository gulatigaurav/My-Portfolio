class Portfolio < ApplicationRecord
     has_many :technologies
     accepts_nested_attributes_for :technologies,
                                  allow_destroy: true,     
                                  reject_if: lambda { |attrs| attrs['name'].blank? }
  includes Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
  where(subtitle: "Angular")
  end
    scope :ruby_on_rails, -> {where(subtitle: "Ruby on Rails")}

  def self.order_by_position
    order("position ASC")
  end



  after_initialize :set_defaults
 # all your model logic in model file
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600',width: '450')
    self.thumb_image ||= Placeholder.image_generator(height: '300',width: '150')
  end
end
