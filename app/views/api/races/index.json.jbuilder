json.array!(@races) do |race|
  json.extract! race, :name
end