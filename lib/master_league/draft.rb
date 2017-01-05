module MasterLeague
  class Draft
    include Virtus.model(finalize: false)

    attribute :team_id, Integer
    attribute :winner, Boolean
    attribute :ban_ids, Array[Integer]
    attribute :picks, Array[Pick]

    def team
      @team ||= TeamRepository.new.find(team_id) if team_id
    end

    def bans
      @bans ||= ban_ids.map do |hero_id|
        HeroRepository.new.find(hero_id)
      end
    end
  end
end
