require "csv"

CSV.foreach('db/restaurants.csv') do |row|
  Restaurant.create(name: row[0], address: row[1], station: row[2], phone: row[3], score: row[4], area_id: row[5])
end
