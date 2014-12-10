class Show < ActiveRecord::Base
  has_many :user_shows
  has_many :users, through: :user_shows

  def self.create_show(show)
    title = show.title.gsub('"', "")
    Show.create(title: title, plot: show.plot, url: show.url, genre: show.genres.join(", "), poster: show.poster, tagline: show.tagline, rating: show.rating) 
  end

  def self.find_show(name, user)
    imdb_search = Imdb::Search.new(name)
    result = imdb_search.movies.first
    show = Imdb::Serie.new(result.id)
    show_title = show.title.gsub('"', "")
    db_result= Show.find_by(:title => show_title)
    if db_result == nil
      new_show = Show.create_show(show)
      user.user_shows.create(show_id: new_show.id)
    else
      if !user.shows.include?(db_result)
        user.user_shows.create(show_id: db_result.id)
      end
    end
  end

end
