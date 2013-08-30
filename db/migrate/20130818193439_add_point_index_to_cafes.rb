class AddPointIndexToCafes < ActiveRecord::Migration
  def up
    execute %{
      create index index_on_cafes_location ON cafes using gist (
        ST_GeographyFromText(
          'SRID=4326;POINT(' || cafes.longitude || ' ' || cafes.latitude || ')'
        )
      )
    }
  end

  def down
    execute %{drop index index_on_cafes_location}
  end
end
