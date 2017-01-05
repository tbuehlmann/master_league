module MasterLeague
  class Map
    include Virtus.model(finalize: false)

    attribute :id, Integer
    attribute :name, String
    attribute :url, String
  end
end
