module Lines
  #
  class Message
    include Virtus.value_object

    attribute :type, String
    attribute :id, String
    attribute :text, String
    attribute :title, String
    attribute :address, String
    attribute :latitude, String
    attribute :longitude, String
  end
end
