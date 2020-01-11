class TopMovies2010s::CLI 
  
  def call
    puts "Top Movies for the 2010s!"
    list_movies
    pick_one
  end 
  
  def list_movies
    #puts "list of movies"
    
    @final_movies = TopMovies2010s::Movies.all
    #puts "********"
    @final_movies.each.with_index(1) do |movie, i|
      puts "#{movie.rank} - #{movie.title} - #{movie.release_year}"
    end 
    
  end
  
  def pick_one

    puts "Enter then rank of which movie you need more info, or type exit to end:"
    input = 0 
    while input != "exit"
      input = gets.strip.downcase 
      
      
      if input.to_i > 0  
        chosen_movie = @final_movies[input.to_i - 1]
        puts "#{chosen_movie.mpaa_rating} - #{chosen_movie.genre} - #{chosen_movie.runtime}"
      elsif input == "list"
        list_movies
      elsif input == "exit"
        puts "Thank you!"

      else "Error: No movie listed for that rank. Please choose another or exit program."
      
    end
  end
    
  end
  
  
  
end 