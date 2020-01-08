class TopMovies2010s::CLI 
  
  def call
    puts "Top Movies for the 2010s!"
    list_movies
    pick_one
  end 
  
  def list_movies
    puts "names of movies"
  end
  
  def pick_one
    puts "Enter which movie rank you want to see:"
    input = nil
    while input != "done"
      input = gets.strip.downcase 
    
      case input 
      when "1"
        puts "good"
      when "2"
        puts "bad"
      when "list"
        list_movies
      else 
        puts "No data for that rank!"
    end
  end
    
  end
  
  
  
end 