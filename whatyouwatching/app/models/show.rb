class Show < ActiveRecord::Base
  has_many :user_shows
  has_many :users, through: :user_shows

  def self.create_show(name)
    i = Imdb::Search.new(name)
    show_id = i.movies.first.id
    show = Imdb::Serie.new(show_id)
    Show.create(title: show.title, plot: show.plot, url: show.url, genre: show.genres.join(", "), poster: show.poster, tagline: show.tagline, rating: show.rating) 
  end

  def self.find_show(name, user)
    #if nil then call create_show
    i = Imdb::Search.new(name)
    show_title = i.movies.first.title
    if Show.find_by(:title => show_title) == nil
      s = Show.create_show(show_title)
      user.user_shows.create(show_id: s.id)
    else
      s = Show.find_by(:title => show_title)
      user.user_shows.create(show_id: s.id)
    end

  end

  # show = []
  # tv_shows.each do |tv_show|
  #   i = Imdb::Search.new(tv_show)
  #   m = i.movies.first
  #   show << m
  #  Show.create(:title => m.title, )
  #  show.first.genres.join(", ")
  # end

  #if show already exists, don't make it again
  # build user_show

end
