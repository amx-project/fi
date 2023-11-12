require 'csv'
require 'json'

CSV.foreach('Finland_addresses_2023-08-14.csv', :headers => true) {|r|
  f = {
    :type => 'Feature',
    :properties => r.to_hash,
    :tippecanoe => {
      :layer => 'address'
    }
  }
  f[:properties][:building_use] = f[:properties][:building_use].to_i
  f[:geometry] = {
    :type => 'Point',
    :coordinates => [
      f[:properties].delete('longitude_wgs84').to_f,
      f[:properties].delete('latitude_wgs84').to_f
    ]
  }
  print "#{JSON.dump(f)}\n"
}

