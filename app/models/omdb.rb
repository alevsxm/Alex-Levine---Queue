class OMDB
  def self.search(term)
    search_url = URI.escape("http://www.omdbapi.com/?s=#{term}")
    api_response = HTTParty.get(search_url)
    results = JSON.parse(api_response)["Search"]

    results_array = []

    results.each do |result|
      results_array << result["imdbID"]
    end

    movie_results = results_array.map do |imdbID|
      JSON.parse(HTTParty.get(URI.escape("http://www.omdbapi.com/?i=#{imdbID}")))
    end

    info_results = movie_results.map do |movie|
      { :title => movie["Title"],
        :director => movie["Director"],
        :actors => movie["Actors"],
        :year_released => movie["Year"],
        :plot_summary => movie["Plot"],
        :img_url => movie["Poster"],
        :rating => movie["imdbRating"],
        :media_type => movie["Type"]
      }
    end
  end
end
