class Expert < ActiveRecord::Base
  attr_accessible :category_id, :description, :first_name, :middle_name,
  :last_name, :photo, :position, :post, :workplace, :partner_id, :remote_photo_url
  
  translates :first_name, :last_name, :middle_name, :description, :position, 
    :post, :workplace

  default_scope { with_translations(I18n.locale) }

  mount_uploader :photo, ExpertUploader

  belongs_to :category
  belongs_to :partner
  has_many :opinions
  has_many :jurors
  has_many :awards, through: :jurors

  validates_presence_of :first_name, :last_name

  def name 
    "#{first_name} #{last_name}" 
  end
end
