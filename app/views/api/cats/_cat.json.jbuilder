json.extract! cat, :id, :name, :age, :color, :gender,
              :wants_outside, :sociable, :description
json.race cat.race.try(:name) || ''
json.images cat.cat_images.map{ |c| full_url(c.path.url) }