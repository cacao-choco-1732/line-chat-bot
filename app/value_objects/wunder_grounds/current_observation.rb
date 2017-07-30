module WunderGrounds
  # 気象情報の詳細クラス
  class CurrentObservation
    include Virtus.value_object

    attribute :display_location, WunderGrounds::DisplayLocation
    attribute :station_id, String
    attribute :observation_epoch, Integer
    attribute :local_time_rfc822, String
    attribute :weather, String
    attribute :temperature_string, String
    attribute :temp_f, String
    attribute :temp_c, String
    attribute :dewpoint_f, Integer
    attribute :dewpoint_c, Integer
    attribute :heat_index_f, Integer
    attribute :heat_index_c, Integer
  end
end
