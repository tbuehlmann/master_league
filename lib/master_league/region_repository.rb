module MasterLeague
  class RegionRepository < Repository
    self.path = 'regions/'

    def order(order)
      raise 'The Regions endpoint does not allow ordering'
    end

    private

    def instantiate_records(regions_json)
      regions_json.map { |region_json| instantiate_record(region_json) }
    end

    def instantiate_record(region_json)
      Region.new(region_json)
    end
  end
end
