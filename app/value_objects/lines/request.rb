module Lines
  # Lineリクエストを受け取るクラス
  class Request
    include Virtus.value_object

    attribute :events, Array[Lines::Event]
  end
end
