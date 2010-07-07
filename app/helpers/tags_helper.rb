module TagsHelper
  def all_tags
    "[#{ ActsAsTaggableOn::Tag.all.collect{|t| "'#{t.name}'"}.join(",") }]"
  end
end