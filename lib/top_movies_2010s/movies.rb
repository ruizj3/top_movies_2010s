class TopMovies2010s::Movies
  attr_accessor :rank, :title, :release_year, :mpaa_rating, :runtime, :genre
  
  def self.all
    self.scrape_all_movies
  end 
  
  def self.scrape_all_movies
    final_movies = []
    
    final_movies << self.scrape_avi 

    final_movies.sort  
  end 
  
  def self.scrape_avi
    desc = Nokogiri::HTML(open("https://www.imdb.com/list/ls003501243/"))
    
  
      
    
    movie = self.new
    movie.rank = desc.search("h3")[10].text.dump.gsub('\n', '').gsub(' ','').scan(/\d+/).first.to_i
    movie.title = desc.search("h3")[10].text.dump.gsub('\n', '').gsub(' ','').split(".")[1].split("(")[0]
    movie.release_year = desc.search("h3")[10].text.dump.gsub('\n', '').gsub(' ','').gsub("(",'').gsub(")",'')[-5..-2].to_i   
    
    movie.mpaa_rating = desc.search("span.certificate").children[10].text
    movie.runtime = desc.search("span.runtime").children[10].text
    movie.genre = desc.search("span.genre").children[10].text.dump.gsub('\n', '')
    
    
    movie
    
    
    
  end 
  

end 