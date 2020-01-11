class TopMovies2010s::Movies
  attr_accessor :rank, :title, :release_year, :mpaa_rating, :runtime, :genre
  
  def self.all
    array = self.scrape_avi
    
  end 
  
  
  def self.scrape_avi
    desc = Nokogiri::HTML(open("https://www.imdb.com/list/ls003501243/"))
    final_movies = []
    
  
      
    (0..99).each do |i|
      movie = self.new
      
      movie.rank = desc.search("h3")[i].text.dump.gsub('\n', '').gsub(' ','').scan(/\d+/).first.to_i
      movie.title = desc.search("h3")[i].text.dump.gsub('\n', '').gsub(' ','').split(".")[1].split("(")[0]
      movie.release_year = desc.search("h3")[i].text.dump.gsub('\n', '').gsub(' ','').gsub("(",'').gsub(")",'')[-5..-2].to_i   
    
      movie.mpaa_rating = desc.search("span.certificate").children[i].text
      movie.runtime = desc.search("span.runtime").children[i].text
      movie.genre = desc.search("span.genre").children[i].text.dump.gsub('\n', '').gsub('"','').gsub(' ','')
      
      
    
      final_movies << movie
      
    end
    
    final_movies 
    
  end 
  

end 