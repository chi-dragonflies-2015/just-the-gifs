get '/gif_search' do
  @search_term = params[:search_term]
  @offset = 0
  responses = $tumblr_client.tagged(@search_term, {offset: @offset})
  #response only handles photo posts, not photosets
  gif_responses = responses.select{|post| post.type=="photo" && post.tags.include?("gif")}


  erb :results
end
