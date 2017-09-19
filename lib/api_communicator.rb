require 'rest-client'
require 'json'
require 'pry'
charcter_hash = {}

def get_character_movies_from_api(character)
  #make the web request
api_address = 'http://www.swapi.co/api/people/'
  all_characters = RestClient.get(api_address)
  binding.pry
  character_hash = JSON.parse(all_characters)
#  binding.pry
  if all_characters.include?(character)

#if character_hash.include?(character)

  character_data = character_hash["results"].find {|data| data["name"] == character}
  film_data = character_data["films"]
  film_hash = film_data.collect {|url| JSON.parse(RestClient.get(url))} # film_names = array of objects
else
  api_address = character_hash["next"]
  binding.pry
end

end


  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.


# def loop_pages()
#   if character
#
#   end
#
# end


def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_ary = []
  films_hash.each do |movie_hash|
    films_ary << movie_hash["title"]
  end
  puts films_ary
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
