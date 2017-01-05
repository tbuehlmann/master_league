module MasterLeague
  class MapRepository < Repository
    self.path = 'maps/'

    def order(order)
      raise 'The Maps endpoint does not allow ordering'
    end

    def page(page)
      raise 'The Maps endpoint does not allow pagination'
    end

    def limit(limit)
      raise 'The Maps endpoint does not allow limiting'
    end

    def where(filters)
      raise 'The Maps endpoint does not allow filtering'
    end

    private

    def instantiate_records(maps_json)
      maps_json.map { |map_json| instantiate_record(map_json) }
    end

    def instantiate_record(map_json)
      Map.new(map_json)
    end
  end
end
