module WunderGrounds
  # geolookup検索結果詳細保持クラス
  class Location
    include Virtus.value_object

    attribute :country, String
    attribute :country_iso3166, String
    attribute :country_name, String
    attribute :state, String
    attribute :city, String
    attribute :tz_short, String
    attribute :tz_long, String
    attribute :lat, String
    attribute :lon, String
    attribute :zip, String
    attribute :magic, String
    attribute :wmo, String
  end
end
