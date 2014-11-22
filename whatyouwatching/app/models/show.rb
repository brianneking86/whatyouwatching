class Show < ActiveRecord::Base
  has_many :user_shows
  has_many :users, through: :user_shows

  def self.create_show(search_res)
    show_id = search_res.id
    show = Imdb::Serie.new(show_id)
    Show.create(title: show.title, plot: show.plot, url: show.url, genre: show.genres.join(", "), poster: show.poster, tagline: show.tagline, rating: show.rating) 
  end

  def self.find_show(name, user)
    #if nil then call create_show
    i = Imdb::Search.new(name)
    m = i.movies.first
    show_title = m.title
    if Show.find_by(:title => show_title) == nil
      s = Show.create_show(m)
      user.user_shows.create(show_id: s.id)
    else
      s = Show.find_by(:title => show_title)
      if !user.shows.include?(s)
        user.user_shows.create(show_id: s.id)
        #add notice saying ahow already exists
      end
    end
  end

end
