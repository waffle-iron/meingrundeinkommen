require './config/boot'
require './config/environment'
require 'httparty'
require 'csv'
require 'pry'


BLOG_URL="//blog.meinbge.de/wp-json/wp/v2"

def retrieve_posts(url, posts_per_page=500)
  @url = url
  @posts_per_page = posts_per_page

  response = HTTParty.get("#{url}/posts?filter[posts_per_page]=#{posts_per_page}")
  response.body.gsub!('http:\\/\\/blog.meinbge.de','https:\\/\\/blog.meinbge.de')
  json = JSON.parse(response.body)

  posts = []
  json.each do |opost|
    post = opost
    thumb = JSON.parse(HTTParty.get("#{BLOG_URL}/media/#{opost['featured_image']}").body)
    if thumb['media_details']
      post['thumb'] = thumb['media_details']['sizes']['post-thumbnail']['source_url'] if thumb['media_details']['sizes']['post-thumbnail']
      post['image'] = thumb['media_details']['sizes']['large']['source_url']          if thumb['media_details']['sizes']['large']
    end
    author = JSON.parse(HTTParty.get("#{BLOG_URL}/users/#{opost['author']}").body)
    post['authorname'] = author['name'] if author['name']
    posts << post
  end
end

posts = retrieve_posts(BLOG_URL, 1)

puts posts
binding.pry

#response = HTTParty.get('http://blog.meinbge.de/wp-json/wp/v2/posts?filter[posts_per_page]=500')
#json = JSON.parse(response.body)
#posts = []
#puts json.length
#json.each do |opost|
  #post = opost
  #thumb = JSON.parse(HTTParty.get("http://blog.meinbge.de/wp-json/wp/v2/media/#{opost['featured_image']}").body)
  #if thumb['media_details']
    #post['thumb'] = thumb['media_details']['sizes']['post-thumbnail']['source_url'] if thumb['media_details']['sizes']['post-thumbnail']
    #post['image'] = thumb['media_details']['sizes']['large']['source_url']          if thumb['media_details']['sizes']['large']
  #end
  #author = JSON.parse(HTTParty.get("http://blog.meinbge.de/wp-json/wp/v2/users/#{opost['author']}").body)
  #post['authorname'] = author['name'] if author['name']
  #posts << post
#end

#puts posts

#File.open("./public/news.json", "w+") do |f|
  #f.write(posts.to_json)
#end



