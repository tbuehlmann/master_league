module MasterLeague
  class HeroRepository < Repository
    self.path = 'heroes/'

    def order(order)
      raise 'The Heroes endpoint does not allow ordering'
    end

    private

    def instantiate_records(heroes_json)
      heroes_json['results'].map { |hero_json| instantiate_record(hero_json) }
    end

    def instantiate_record(hero_json)
      hero_json[:role_id] = hero_json.delete('role')
      Hero.new(hero_json)
    end
  end
end
