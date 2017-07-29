module Lines
  # リクエストのeventsキーオブジェクト
  class Event
    include Virtus.value_object

    attribute :type, String
    attribute :replyToken, String
    attribute :source, Hash
    attribute :timestamp, Integer
    attribute :message, Hash
    attribute :latitude, String
    attribute :longitude, String

    def message?
      type == 'message'
    end

    def location?
      type == 'location'
    end
  end
end
