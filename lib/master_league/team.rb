module MasterLeague
  class Team
    include Virtus.model(finalize: false)

    attribute :id, Integer
    attribute :name, String
    attribute :region_id, Integer
    attribute :url, String
    attribute :logo, Hash

    def region
      @region ||= RegionRepository.new.find(region_id) if region_id
    end
  end
end
