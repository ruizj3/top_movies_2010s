class TopMovies2010s::Movies
  attr_accessor :title, :year 
  
  def self.all 
    puts "some movies here"
    
    movie_1 = Movie.new 
    movie_1.title = "so good"
    movie_1.year = '2010'
    
    movie_2 = Movie.new 
    movie_2.title = "so bad"
    movie_2.year = '2011'
    
    
    [movie_1,movie_2]
  end 
  
end 