module MasterLeague
  class Pick
    include Virtus.model(finalize: false)

    attribute :hero_id, Integer
    attribute :player_id, Integer

    def hero
      @hero ||= HeroRepository.new.find(hero_id) if hero_id
    end

    def player
      @player ||= PlayerRepository.new.find(player_id) if player_id
    end
  end
end
