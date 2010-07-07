module ActsAsTaggableOn
  class Tag
    def posts
      Post.tagged_with(self.name)
    end
  end
end