require 'pathname'
require 'yaml/store'

module MasterLeague
  class Cache
    def initialize(path: '~/.config/master_league_cache.yml')
      path = Pathname.new(path).expand_path

      if path.file? || path.parent.directory?
        @store = YAML::Store.new(path)
      else
        raise "#{path} is not a valid path for the Cache"
      end
    end

    def write(key, value)
      @store.transaction do
        @store[key] = value
      end
    end

    def read(key)
      @store.transaction do
        @store[key]
      end
    end

    def fetch(key, &block)
      @store.transaction do
        value = @store[key]

        if value
          value
        else
          @store[key] = yield
        end
      end
    end

    def delete(key)
      @store.transaction do
        @store.delete(key)
      end
    end

    def clear
      @store.transaction do
        @store.path.delete
      end
    end
  end
end
