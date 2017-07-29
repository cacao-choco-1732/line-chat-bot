module WunderGrounds
  # 位置情報からエリア名を割り出し、エリアを対象とした気象情報を検索するサービス
  class GeoLookupToCondition
    # @param [String] latitude 緯度
    # @param [String] longitude 経度
    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end

    # @return [WunderGrounds::Condition] 検索結果
    def execute
      search_location
      # condition(search_location.location.city)
    end

    private

    # 緯度・経度情報からエリアを検索
    #
    # @return [WunderGrounds::SearchLocation] ロケーション情報
    def search_location
      SearchLocation.new(gateway.geolookup(latitude, longitude))
    end

    # 気象情報の取得
    #
    # @param [String] city 都市名
    # @return [WunderGrounds::Condition] 気象情報
    def condition(city)
      Condition.new(gateway.condition(city))
    end

    # @return [WunderGrounds::Gateway] http://api.wunderground.com/api ゲートウェイ
    def gateway
      @gateway ||= Gateway.new
    end

    attr_reader :latitude, :longitude
  end
end
