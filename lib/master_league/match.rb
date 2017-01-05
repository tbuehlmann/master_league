module MasterLeague
  class Match
    include Virtus.model(finalize: false)

    attribute :id, Integer
    attribute :date, Date
    attribute :patch_id, Integer
    attribute :tournament_id, Integer
    attribute :stage, Integer
    attribute :round, String
    attribute :series, Integer
    attribute :game, Integer
    attribute :map_id, Integer
    attribute :url, String
    attribute :drafts, Array[Draft]

    def patch
      @patch ||= PatchRepository.new.find(patch_id) if patch_id
    end

    def tournament
      @tournament ||= TournamentRepository.new.find(tournament_id) if tournament_id
    end

    def map
      @map ||= MapRepository.new.find(map_id) if map_id
    end
  end
end
