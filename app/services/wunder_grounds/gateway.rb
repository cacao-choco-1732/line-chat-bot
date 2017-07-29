module WunderGrounds
  # http://api.wunderground.com/api ゲートウェイクラス
  class Gateway
    # @param [String] latitude 緯度
    # @param [String] longitude 経度
    # @return [Hash] API取得結果JSON
    def geolookup(latitude, longitude)
      # http://api.wunderground.com/api/{key}/geolookup/q/37.776289,-122.395234.json
      res = client.get do |req|
        req.url "geolookup/q/#{[latitude, longitude].join(',')}.json"
      end
      JSON.parse(res.body)
    end

    # @param [String] city_name 都市名
    # @return [Hash] API取得結果JSON
    def condition(city_name)
      # http://api.wunderground.com/api/{key}/conditions/lang:JP/q/{city_name}.json
      res = client.get do |req|
        req.url "conditions/lang:JP/q/#{city_name}.json"
      end
      JSON.parse(res.body)
    end

    private

    # @return [Faraday] Faradayインスタンス
    def client
      @client ||= Faraday.new(url: [Settings.wunder_grounds.api, Settings.wunder_grounds.token].join('/'))
    end
  end
end
