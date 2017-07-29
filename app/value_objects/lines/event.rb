module Lines
  # リクエストのeventsキーオブジェクト
  class Event
    include Virtus.value_object

    attribute :type, String
    attribute :replyToken, String
    attribute :source, Hash
    attribute :timestamp, Integer
    attribute :message, Message

    def text?
      message.type == 'text'
    end

    def location?
      message.type == 'location'
    end
  end
end
