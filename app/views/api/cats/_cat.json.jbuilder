json.extract! cat, :name, :age, :color, :description, :gender,
              :wants_outside, :sociable
json.race cat.race.try(:name) || ''
json.images cat.cat_images.map{ |c| full_url(c.path.url) }