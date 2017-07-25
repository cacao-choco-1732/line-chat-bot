module Lines
  class Event
    include Virtus.value_object

    attribute :type, String
    attribute :reply_token, String
    attribute :source, Hash
    attribute :timestamp, Integer
    attribute :message, Hash
  end
end
