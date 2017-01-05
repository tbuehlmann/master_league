module MasterLeague
  class Patch
    include Virtus.model(finalize: false)

    attribute :id, Integer
    attribute :name, String
    attribute :from_date, Date
    attribute :to_date, Date
  end
end
