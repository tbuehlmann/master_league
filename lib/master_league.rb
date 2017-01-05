require 'virtus'

require 'master_league/cache'
require 'master_league/fetcher'
require 'master_league/version'

require 'master_league/repository'
require 'master_league/event_repository'
require 'master_league/hero_repository'
require 'master_league/map_repository'
require 'master_league/match_repository'
require 'master_league/patch_repository'
require 'master_league/player_repository'
require 'master_league/region_repository'
require 'master_league/team_repository'
require 'master_league/tournament_repository'

require 'master_league/pick'
require 'master_league/draft'
require 'master_league/event'
require 'master_league/patch'
require 'master_league/player'
require 'master_league/region'
require 'master_league/stage'
require 'master_league/talent'
require 'master_league/team'
require 'master_league/tournament'
require 'master_league/hero'
require 'master_league/map'
require 'master_league/match'

Virtus.finalize

module MasterLeague
  class << self
    def fetcher
      @fetcher ||= Fetcher.new
    end

    def fetch(path, params = {})
      fetcher.fetch(path, params)
    end

    def enable_caching
      @caching_enabled = true
    end

    def disable_caching
      @caching_enabled = false
    end

    def caching_enabled?
      !!@caching_enabled
    end

    def cache
      @cache ||= Cache.new
    end
  end
end
