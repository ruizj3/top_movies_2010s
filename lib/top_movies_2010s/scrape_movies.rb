class TopMovies2010s::ScrapeMovies
  
  def self.scrape_avi
    desc = Nokogiri::HTML(open("https://www.imdb.com/list/ls003501243/"))
    
  
    (0..99).each do |i|
      movie = TopMovies2010s::Movies.new
      
      movie.rank = desc.search("h3")[i].text.dump.gsub('\n', '').gsub(' ','').scan(/\d+/).first.to_i
      movie.title = desc.search("h3")[i].text.dump.gsub('\n', '').gsub(' ','').split(".")[1].split("(")[0]
      movie.release_year = desc.search("h3")[i].text.dump.gsub('\n', '').gsub(' ','').gsub("(",'').gsub(")",'')[-5..-2].to_i   
    
      movie.mpaa_rating = desc.search("span.certificate").children[i].text
      movie.runtime = desc.search("span.runtime").children[i].text
      movie.genre = desc.search("span.genre").children[i].text.dump.gsub('\n', '').gsub('"','').gsub(' ','')
      
      movie.metascore = desc.search("div.inline-block.ratings-metascore")[i] ? desc.search("div.inline-block.ratings-metascore")[i].text.dump.gsub('\n', '').scan(/\d+/).first.to_i : 'None'
    
      
    end
    
    
  end
end 