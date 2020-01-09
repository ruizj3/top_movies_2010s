class TopMovies2010s::CLI 
  
  def call
    puts "Top Movies for the 2010s!"
    list_movies
    pick_one
  end 
  
  def list_movies
    puts "names of movies"
    
    @movies = TopMovies2010s::Movies.all 
    @movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title} - #{movie.year}"
    end 
    
  end
  
  def pick_one
    puts "Enter which movie rank you want to see:"
    input = nil
    while input != "done"
      input = gets.strip.downcase 
      
      if input.to_i > 0 
        puts @movies[input.to_i - 1]
      elsif input == "list"
        list_movies
      else puts "nothing for ya"
      
    end
  end
    
  end
  
  
  
end 