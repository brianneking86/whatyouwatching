class Show < ActiveRecord::Base
  has_many :user_shows
  has_many :users, through: :user_shows

  def create_show
    # i = Imdb::Search.now("#{show_name}")
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
