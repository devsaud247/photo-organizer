require 'date'

class PhotoOrganizer
  def initialize
    @photo_data = []
  end

  def add_photo(photo_info)
    name, city, date_time = photo_info.split(', ')
    extension = name.split('.')[-1]
    @photo_data << {
      'name' => name,
      'city' => city,
      'date_time' => date_time,
      'extension' => extension
    }
  end

  def parse_dates
    @photo_data.each do |photo|
      photo['timestamp'] = DateTime.strptime(photo['date_time'], '%Y-%m-%d %H:%M:%S')
    end
  end

  def organize_photos
    city_groups = Hash.new { |hash, key| hash[key] = [] }

    @photo_data.each do |photo|
      city_groups[photo['city']] << photo
    end

    result = []

    @photo_data.each do |photo|
      city = photo['city']
      photos = city_groups[city]
      photos.sort_by! { |p| p['timestamp'] }
      max_number_length = photos.length.to_s.length

      i = photos.index(photo) + 1
      new_name = "#{city}#{i.to_s.rjust(max_number_length, '0')}.#{photo['extension']}"
      result << new_name
    end

    result
  end
end

def solution(s)
  photo_organizer = PhotoOrganizer.new

  s.strip.split("\n").each do |photo|
    photo_organizer.add_photo(photo)
  end

  photo_organizer.parse_dates

  organized_photos = photo_organizer.organize_photos

  organized_photos.join("\n")
end

input_string = <<~INPUT
  photo.jpg, Krakow, 2013-09-05 14:08:15
  Mike.png, London, 2015-06-20 15:13:22
  myFriends.png, Krakow, 2013-09-05 14:07:13
  Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02
  pisatower.jpg, Florianopolis, 2015-07-22 23:59:59
  BOB.jpg, London, 2015-08-05 00:02:03
  notredame.png, Florianopolis, 2015-09-01 12:00:00
  me.jpg, Krakow, 2013-09-06 15:40:22
  a.png, Krakow, 2016-02-13 13:33:50
  b.jpg, Krakow, 2016-01-02 15:12:22
  c.jpg, Krakow, 2016-01-02 14:34:30
  d.jpg, Krakow, 2016-01-02 15:15:01
  e.png, Krakow, 2016-01-02 09:49:09
  f.png, Krakow, 2016-01-02 10:55:32
  g.jpg, Krakow, 2016-02-29 22:13:11
INPUT

puts solution(input_string)
