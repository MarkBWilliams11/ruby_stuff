=begin 
Movie theatre example:

Assume we have a theatre with a location and a name, with a selection of movies
=end


class Cinema
  attr_accessor :name, :location

  def initialize(name, location) #=>name and location of theatre
    @name = name
    @location = location
    @movies =[]   #=> room to store movie name and time 
  end

  #
  def add_movie(movie)
    @movies<<movie
    movie.cinema =self #(self here is referring to the theatre Cinema class)
  end
end  

class Movie
  attr_accessor :title, :showtime, :cinema #=> have Movie behaviours cinema is basically Movie class
@@all =[]                                     

  def initialize(title,showtime)
    @title = title
    @showtime = showtime
    @@all << self
  end
end

p cb = Cinema.new("CB", "123 main st")
p the_movie = Movie.new("movie", '9:00')

p cb.add_movie(the_movie)