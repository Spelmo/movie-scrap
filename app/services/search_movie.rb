require 'dotenv'
require 'themoviedb'

class SearchMovie
  def initialize(query)
  @query = query
end

def perform
  data_retrieval(@query)
end

def log_API
  Dotenv.load
  Tmdb::Api.key(Rails.application.credentials.themoviedb)
end

def data_retrieval(query)
  log_API
  @search = Tmdb::Search.new
  @search.resource('movie') # determines type of resource
  @search.query(@query) # the query to search against
  @array = @search.fetch # makes request

#format the result the right way
  @newarr = {}
    @array.each do |film|
       movie = Tmdb::Movie.detail(film["id"])

# looks for director
#       cast = Tmdb::Movie.credits(film["id"])
#       cast['crew'].each do |key, value|
#          if key['department'] == 'Directing'
#            @director = key['department']['name']
#            puts @director
#          end
#       end

     @newarr[movie["title"]] = movie["release_date"]
       end
  return @newarr
end

end
