class Expert < ActiveRecord::Base
  attr_protected
  translates :first_name, :last_name, :middle_name, :description, :position, 
    :post, :workplace

  default_scope { with_translations(I18n.locale) }

  mount_uploader :photo, ExpertUploader

  belongs_to :category
  belongs_to :partner
  has_many :opinions
  has_many :jurors
  has_many :awards, through: :jurors
  has_many :monthly_experts
  has_many :months, through: :monthly_experts

  validates_presence_of :first_name, :last_name

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def name 
    "#{first_name} #{last_name}" 
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end
end
