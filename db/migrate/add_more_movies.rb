class AddMoreMovies < ActiveRecord::Migration
  MORE_MOVIES = [
    {:title => 'The Hobbit', :rating => 'G', :release_date => '25-Dec-2012'},
    {:title => 'Spider Man', :rating => 'R', :release_date => '26-Oct-2007'},
    {:title => 'Life of Pie', :rating => 'R', :release_date => '29-Dec-2012'},
    {:title => '300', :rating => 'PG-13', :release_date => '13-Aug-2007'},
    {:title => 'Titanic', :rating => 'PG-13', :release_date => '15-Jan-1995'},
    {:title => 'Iron Man', :rating => 'R', :release_date => '19-Apr-2009'},
  ]
  def up
    Movie.delete_all
    MORE_MOVIES.each do |movie|
      Movie.create!(movie)
    end
  end

  def down
    MORE_MOVIES.each do |movie|
      Movie.find_by_title_and_rating(movie[:title], movie[:rating]).destroy
    end
  end
end
