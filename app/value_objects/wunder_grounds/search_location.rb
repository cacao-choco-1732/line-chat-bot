module WunderGrounds
  # geolookup検索結果保持クラス
  class SearchLocation
    include Virtus.value_object

    attribute :location, Location
  end
end
