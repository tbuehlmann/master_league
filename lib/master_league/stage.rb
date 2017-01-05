module MasterLeague
  class Stage
    include Virtus.model(finalize: false)

    attribute :id, Integer
    attribute :name, String
  end
end
