module MasterLeague
  class TournamentRepository < Repository
    self.path = 'tournaments/'

    def order(order)
      raise 'The Tournaments endpoint does not allow ordering'
    end

    private

    def instantiate_records(tournaments_json)
      tournaments_json['results'].map { |tournament_json| instantiate_record(tournament_json) }
    end

    def instantiate_record(tournament_json)
      tournament_json[:region_id] = tournament_json.delete('region')
      Tournament.new(tournament_json)
    end
  end
end
