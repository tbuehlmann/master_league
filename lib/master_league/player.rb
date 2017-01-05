module MasterLeague
  class Player
    include Virtus.model(finalize: false)

    attribute :id, Integer
    attribute :team_id, Integer
    attribute :region_id, Integer
    attribute :nickname, String
    attribute :realname, String
    attribute :country, String
    attribute :role_id, Integer
    attribute :url, String
    attribute :photo, Hash

    def team
      @team ||= TeamRepository.new.find(team_id) if team_id
    end

    def region
      @region ||= RegionRepository.new.find(region_id) if region_id
    end

    def role
      Hero::ROLES[role_id]
    end
  end
end
