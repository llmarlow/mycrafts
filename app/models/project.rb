class Project < ActiveRecord::Base
  belongs_to :user
  has_many :updates
  has_attached_file :finished_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :finished_image, :content_type => /\Aimage\/.*\Z/
end
