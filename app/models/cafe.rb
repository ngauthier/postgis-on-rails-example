class Cafe < ActiveRecord::Base
  self.table_name = "cafes"

  scope :closest, -> (lat, lon) {
    order(%{
      ST_Distance(
        ST_GeographyFromText(
          'SRID=4326;POINT(' || cafes.latitude || ' ' || cafes.longitude || ')'
        ),
        ST_GeographyFromText('SRID=4326;POINT(%f %f)')
      )
      ASC
    } % [lat, lon])
  }
end
