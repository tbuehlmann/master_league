module MasterLeague
  class Tournament
    include Virtus.model(finalize: false)

    attribute :id, Integer
    attribute :name, String
    attribute :start_date, Date
    attribute :end_date, Date
    attribute :region_id, Integer
    attribute :url, String
    attribute :stages, Array[Stage]

    def region
      RegionRepository.new.find(region_id) if region_id
    end
  end
end
