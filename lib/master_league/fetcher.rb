require 'http'

module MasterLeague
  class Fetcher
    attr_reader :last_response

    def fetch(path, params = {})
      if MasterLeague.caching_enabled?
        cache_key = [path, params].join('.')
        cached_response = MasterLeague.cache.read(cache_key)

        if cached_response
          cached_response
        else
          response = HTTP.get("#{base_url}/#{path}", params: params.merge(format: 'json'))
          handle_response(response, cache_key: cache_key)
        end
      else
        response = HTTP.get("#{base_url}/#{path}", params: params.merge(format: 'json'))
        handle_response(response)
      end
    end

    private

    def handle_response(response, cache_key: nil)
      @last_response = response

      if response.status.ok?
        if cache_key
          MasterLeague.cache.write(cache_key, response.parse)
        else
          response.parse
        end
      else
        raise "Something went wrong. #{response.status}: #{response}"
      end
    end

    def base_url
      'https://api.masterleague.net'
    end
  end
end
