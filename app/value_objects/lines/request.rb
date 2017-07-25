module Lines
  class Request
    include Virtus.value_object

    attribute :events, Array[Lines::Event], default: []

    class << self
      def create(params)
        params.each do |event|
          self.events << Lines::Event.new(
            type: event[:type],
            reply_token: event[:replyToken],
            source: event[:source],
            timestamp: event[:timestamp],
            message: event[:message]
          )
        end
      end
    end
  end
end
