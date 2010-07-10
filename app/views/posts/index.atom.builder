atom_feed do |feed|
  feed.title "rails-bestpractices.com"
  feed.updated(@posts.first.created_at)

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title post.title
      entry.content post.description
      entry.updated post.created_at
      entry.author do |author|
        author.name post.user.login
      end
    end
  end
end
