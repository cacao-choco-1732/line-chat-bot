module WunderGrounds
  # 気象情報クラス
  class Condition
    include Virtus.value_object

    attribute :current_observation, WunderGrounds::CurrentObservation
  end
end
