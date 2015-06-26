get '/gif_search' do
  @search_term = params[:search_term]
  api_key = "dc6zaTOxFJmzC"
  limit = 25
  url = "http://api.giphy.com/v1/gifs/search?q=#{@search_term.gsub(" ", "+")}&api_key=#{api_key}"
  url += "&limit=#{limit}" if limit
  resp = Net::HTTP.get_response(URI.parse(url))
  buffer = resp.body
  results = JSON.parse(buffer)
  @images = []
  results["data"].each.with_index do |result, result_index|
    image ={}
    image[:url] = result["url"]
    image[:display] = result["images"]["fixed_height"]
    image[:display_still] = result["images"]["fixed_height_still"]
    image[:original] = result["images"]["original"]
    @images.push(image)
  end
  erb :results
end


#results are set by results["data"][index]
# url is results["data"][index]["url"]
# image information for display
  #results["data"][index]["images"]["fixed_height"]
  #results["data"][index]["images"]["original"]
