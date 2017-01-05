module MasterLeague
  class PlayerRepository < Repository
    self.path = 'players/'

    def order(order)
      raise 'The Players endpoint does not allow ordering'
    end

    private

    def instantiate_records(players_json)
      players_json['results'].map { |player_json| instantiate_record(player_json) }
    end

    def instantiate_record(player_json)
      player_json[:team_id] = player_json.delete('team')
      player_json[:role_id] = player_json.delete('role')

      Player.new(player_json)
    end
  end
end
