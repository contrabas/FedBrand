ActsAsTaggableOn::Tag.class_eval do
  before_save { |tag| tag.slug = tag.name.parameterize if name_changed? }

  def to_param
    slug
  end
end