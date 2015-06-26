get '/gif_search' do
  @search_term = params[:search_term]
  @offset = 0
  responses = $tumblr_client.tagged(@search_term, {offset: @offset})
  #response only handles photo posts, not photosets
  gif_responses = responses.select{|post| post.type=="photo" && post.tags.include?("gif")}
  @posts = []
  gif_responses.each do |response|
    post = {}
    post[:post_url] = response["post_url"]
    post[:category] = @search_term
    post[:image_url] = response["photos"].first["original_size"]["url"]
    post[:image_width] = response["photos"].first["original_size"]["width"]
    post[:image_height] = response["photos"].first["original_size"]["height"]
    @posts.push(post)
  end
  erb :results
end
