require 'time'

class Movie
  attr_reader :title, :genre, :start_time

  def initialize(movie_row)
    @title = movie_row[:title]
    @genre = movie_row[:genre]
    @start_time = Time.parse(movie_row[:start_time].to_s.strip)
  end

  def showing_after?(time)
    @start_time >= Time.parse(time)
  end

  def comedy?()
    @genre == "Comedy"
  end

  def showing_between?(time1, time2)
    @start_time >= Time.parse(time1) && @start_time <= Time.parse(time2)
  end
end

movies = [
  {title: "The Princess Bride", genre: "Comedy", start_time: "7:00PM"},
  {title: "Troll 2", genre: "Horror", start_time: "7:30PM"},
  {title: "Pet Cemetery", genre: "Horror", start_time: "8:15PM"},
  {title: "Flight of the Navigator", genre: "Adventure",start_time: "8:17PM"},
  {title: "Teen Witch", genre: "Comedy", start_time: "8:20PM"},
  {title: "The Goonies", genre: "Comedy", start_time: "8:30PM"},
  {title: "Better Off Dead", genre: "Comedy", start_time: "8:45PM"},
  {title: "Weekend at Bernies", genre: "Comedy", start_time:  "9:00PM"},
  {title: "The Wizard", genre: "Adventure", start_time: "9:10PM"}
]

movies_list = []

movies.each do |movie_row|
  movies_list << Movie.new(movie_row)
end
