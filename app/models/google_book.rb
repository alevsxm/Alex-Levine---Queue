class GoogleBook
  def self.search(term)
    google_api_key = ENV['GOOGLE_API_KEY']
    search_url = "https://www.googleapis.com/books/v1/volumes?q=#{term}&key=#{google_api_key}"
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
