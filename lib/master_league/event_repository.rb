module MasterLeague
  class EventRepository < Repository
    self.path = 'calendar/'

    def order(order)
      raise 'The Events endpoint does not allow ordering'
    end

    private

    def instantiate_records(events_json)
      events_json['results'].map { |event_json| instantiate_record(event_json) }
    end

    def instantiate_record(event_json)
      Event.new(event_json)
    end
  end
end
