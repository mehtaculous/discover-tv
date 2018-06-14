module TvShowsHelper

  BASE_IMAGE_URL = "https://image.tmdb.org/t/p/"

  GENRES = {
    12 => "Adventure", 14 => "Fantasy", 16 => "Animation", 18 => "Drama", 27 => "Horror", 28 => "Action", 35 => "Comedy",
    36 => "History", 37 => "Western", 53 => "Thriller", 80 => "Crime", 99 => "Documentary", 878 => "Science Fiction",
    9648 => "Mystery", 10402 => "Music", 10749 => "Romance", 10751 => "Family", 10752 => "War", 10759 => "Adventure",
    10762 => "Kids", 10763 => "News", 10764 => "Reality", 10765 => "Sci-Fi", 10766 => "Soap", 10767 => "Talk",
    10768 => "Politics", 10770 => "TV Movie"
  }

  def genre(id)
    GENRES[id]
  end

  def first_air(date)
    date.present? ? date.to_date.strftime('%B %-d, %Y') : "Not Available"
  end

  def backdrop_present?(image_path)
    image_path.present? ? BASE_IMAGE_URL + 'w1280' + image_path : 'backdrop.png'
  end

  def poster_present?(image_path)
    image_path.present? ? BASE_IMAGE_URL + 'w1280' + image_path : 'poster.png'
  end

  def logo(image_path)
    BASE_IMAGE_URL + 'w92' + image_path
  end

  def rating_color(num)
    if num >= 8
      "success"
    elsif num >= 5
      "warning"
    elsif num > 0
      "danger"
    else
      "primary"
    end
  end

  def rating_percentage(num)
    num == 0 ? "NR" : "#{(num * 10).to_int}%"
  end

end
