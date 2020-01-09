class TopMovies2010s::Movies
  attr_accessor :title, :year 
  
  def self.all
    self.scrape_all_movies
  end 
  
  def scrape_all_movies
    final_movies = []
    
    movie_1 = self.new 
    movie_1.title = "so good"
    movie_1.year = '2010'
    
    movie_2 = self.new 
    movie_2.title = "so bad"
    movie_2.year = '2011'
    
    
    final_movies
  end 
  
end 