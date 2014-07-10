class GoogleBook
  def self.search(term)
    search_url = "https://www.googleapis.com/books/v1/volumes?q=#{term}&key=AIzaSyDqIQLD2MaNV4xvozWF7Ty8dgUuee_Ba5k"
    api_response = HTTParty.get(URI.escape(search_url))
    search_results = api_response["items"]

    search_results_array = search_results.map do |result|
      { :author => result["volumeInfo"]["authors"].nil? ? "No Author Provided" : result["volumeInfo"]["authors"].join(', '),
        :img_url => result["volumeInfo"]["imageLinks"].nil? ? "No Image Provided" : result["volumeInfo"]["imageLinks"]["thumbnail"],
        :title => result["volumeInfo"]["title"],
        :year_published => result["volumeInfo"]["publishedDate"].split('').take(4).join,
        :plot_summary => result["volumeInfo"]["description"],
        :rating => result["volumeInfo"]["averageRating"]
        }
    end
  end
end
