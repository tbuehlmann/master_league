module MasterLeague
  class Event
    include Virtus.model(finalize: false)

    attribute :date, DateTime
    attribute :stage, Integer
    attribute :is_live, Boolean
    attribute :streams, Array[String]
  end
end
