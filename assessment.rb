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
