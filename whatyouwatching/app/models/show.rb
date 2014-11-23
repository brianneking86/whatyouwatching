class Show < ActiveRecord::Base
  has_many :user_shows
  has_many :users, through: :user_shows

  def self.create_show(show)
    title = show.title.gsub('"', "")
    Show.create(title: title, plot: show.plot, url: show.url, genre: show.genres.join(", "), poster: show.poster, tagline: show.tagline, rating: show.rating) 
  end

  def self.find_show(name, user)
    i = Imdb::Search.new(name)
    m = i.movies.first
    show = Imdb::Serie.new(m.id)
    s_title = show.title.gsub('"', "")
    s = Show.find_by(:title => s_title)
    if s == nil
      s = Show.create_show(show)
      user.user_shows.create(show_id: s.id)
    else
      if !user.shows.include?(s)
        user.user_shows.create(show_id: s.id)
        #add notice saying show already exists
      end
    end
  end

end
