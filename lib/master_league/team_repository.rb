module MasterLeague
  class TeamRepository < Repository
    self.path = 'teams/'

    private

    def instantiate_records(teams_json)
      teams_json['results'].map { |team_json| instantiate_record(team_json) }
    end

    def instantiate_record(team_json)
      team_json[:region_id] = team_json.delete('region')
      Team.new(team_json)
    end
  end
end
