# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.playcal.jp"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.


  add find_path, priority: 0.6, changefreq: 'daily'
  add search_path, priority: 0.6, changefreq: 'daily'
  add tourlists_path, priority: 0.6, changefreq: 'daily'
  add about_path, priority: 0.1, changefreq: 'monthly'
  add new_user_registration_path, priority: 0.1, changefreq: 'monthly'
  add new_user_session_path, priority: 0.1, changefreq: 'monthly'
  add new_contacts_path, priority: 0.1, changefreq: 'monthly'
  add new_user_password_path, priority: 0.1, changefreq: 'monthly'
  add new_user_confirmation_path, priority: 0.1, changefreq: 'monthly'
  add new_user_unlock_path, priority: 0.1, changefreq: 'monthly'


  Chatbox.find_each do |chatbox|
    add "/#{chatbox.chatname}", priority: 0.3, lastmod: chatbox.created_at, changefreq: 'daily'
  end

  User.find_each do |user|
   add "/#{user.name}", priority: 0.3, lastmod: user.created_at, changefreq: 'daily'
 end

   Post.find_each do |post|
  add post_path(post), priority: 0.3, lastmod: post.created_at, changefreq: 'daily'
 end









  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
