module MasterLeague
  class MatchRepository < Repository
    self.path = 'matches/'

    private

    def instantiate_records(matches_json)
      matches_json['results'].map { |match_json| instantiate_record(match_json) }
    end

    def instantiate_record(match_json)
      match_json[:patch_id] = match_json.delete('patch')
      match_json[:tournament_id] = match_json.delete('tournament')
      match_json[:map_id] = match_json.delete('map')

      match_json['drafts'].each do |draft_json|
        draft_json[:winner] = draft_json.delete('is_winner')
        draft_json[:team_id] = draft_json.delete('team')
        draft_json[:ban_ids] = draft_json.delete('bans')

        draft_json['picks'].each do |pick_json|
          pick_json[:hero_id] = pick_json['hero']
          pick_json[:player_id] = pick_json['player']
        end
      end

      Match.new(match_json)
    end
  end
end
