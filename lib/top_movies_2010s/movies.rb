class TopMovies2010s::Movies
  attr_accessor :rank, :title, :release_year, :mpaa_rating, :runtime, :genre, :metascore
  
  @@all = []
  
  def initialize
    @@all << self 
  end 
    
  def self.all
    @@all 
  end 
  
  

end 