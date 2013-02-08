ActsAsTaggableOn::Tag.class_eval do
  before_save{|tag| tag.slug=Russian::transliterate(tag.name) if name_changed?}

  def to_param
    slug
  end
end