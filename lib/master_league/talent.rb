module MasterLeague
  class Talent
    include Virtus.model(finalize: false)

    attribute :tier, Integer
    attribute :choice, Integer
    attribute :name, String
    attribute :description, String
    attribute :icon, Hash
  end
end
