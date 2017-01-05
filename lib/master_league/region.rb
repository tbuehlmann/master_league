module MasterLeague
  class Region
    include Virtus.model(finalize: false)

    attribute :id, Integer
    attribute :name, String
  end
end
