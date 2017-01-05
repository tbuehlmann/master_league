module MasterLeague
  class Hero
    include Virtus.model(finalize: false)

    ROLES = {
      1 => 'Warrior',
      2 => 'Support',
      3 => 'Assassin',
      4 => 'Specialist'
    }

    attribute :id, Integer
    attribute :name, String
    attribute :role_id, Integer
    attribute :url, String
    attribute :portrait, Hash
    attribute :talents, Array[Talent]

    def role
      ROLES[role_id]
    end

    def reload
      self.attributes = HeroRepository.new.find(id).attributes
      self
    end
  end
end
