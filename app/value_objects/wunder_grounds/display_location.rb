module WunderGrounds
  # 取得対象のエリア情報クラス
  class DisplayLocation
    include Virtus.value_object

    attribute :full, String
    attribute :city, String
    attribute :state, String
    attribute :state_name, String
  end
end
