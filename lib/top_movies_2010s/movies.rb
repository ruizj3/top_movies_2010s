class TopMovies2010s::Movies
  attr_accessor :rank, :title, :release_year, :mpaa_rating, :runtime, :genre
  
  def self.all
    self.scrape_all_movies
  end 
  
  def self.scrape_all_movies
    final_movies = []
    
    final_movies << self.scrape_avi 

    final_movies
  end 
  
  def self.scrape_avi
    desc = Nokogiri::HTML(open("https://www.imdb.com/list/ls003501243/"))
    rank = desc.search("h3")[10].text.dump.gsub('\n', '').gsub(' ','').scan(/\d+/).first.to_i
    title = desc.search("h3")[10].text.dump.gsub('\n', '').gsub(' ','').split(".")[1].split("(")[0]
    release_year = desc.search("h3")[10].text.dump.gsub('\n', '').gsub(' ','').gsub("(",'').gsub(")",'')[-5..-2].to_i   
    
    mpaa_rating = desc.search("span.certificate").text[10]
    runtime = desc.search("span.runtime").text.gsub("min",",").gsub(' ','').split(',').each { |c| puts c}[10].to_i
    genre = desc.search("span.genre").text[10]

    
    binding.pry 
  end 
  
  
end 