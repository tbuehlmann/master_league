# MasterLeague

The MasterLeague Gem is a Client that consumes the [Master League API](https://api.masterleague.net/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'master_league'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install master_league

## Usage

Each record that is available through an API endpoint can be retrieved by a repository. Example:

```ruby
repository = MasterLeague::HeroRepository.new

repository.each do |hero|
  puts "#{hero.name} (#{hero.role})"
end

# Abathur (Specialist)
# Alarak (Assassin)
# Anub'arak (Warrior)
# ...
```

You can also retrieve single records by their id:

```ruby
hero = repository.find(33)
hero.name # => 'Tassadar'
```

When retrieving multiple Heroes from the API, some information are missing. You can reload a Hero's information by calling `hero.reload`.

## Filtering

Depending on what API endpoint you're working with, there are some filters:

```ruby
repository.limit(10)       # returns at most 10 records
repository.page(2)         # returns the second page of records
repository.order('date')   # orders the records by date (ascending)
repository.order('-date')  # orders the records by date (descending)
repository.where(hero: 33) # filters to the records having `hero` set to 33
```

You can also chain filters, as in:

```
repository.limit(15).page(2)
```

Not all API endpoints are open to every filter, here's a matrix for you:

|      /      | default limit |   max limit   | paginatable | orderable by |                where/filterable by                |
|:-----------:|:-------------:|:-------------:|:-----------:|:------------:|:-------------------------------------------------:|
| Heroes      |       20      |       60      |     yes     |    nothing   |                        role                       |
| Maps        | not limitable | not limitable |      no     |    nothing   |                      nothing                      |
| Regions     | not limitable | not limitable |      no     |    nothing   |                      nothing                      |
| Patches     | not limitable | not limitable |      no     |    nothing   |                      nothing                      |
| Teams       |       20      |      100      |     yes     |    nothing   |                       region                      |
| Players     |       20      |      100      |     yes     |    nothing   |                    team, region                   |
| Tournaments |       20      |       30      |     yes     |    nothing   |                       region                      |
| Matches     |       10      |       25      |     yes     |   id, date   | map, patch, tournament, stage, team, hero, player |
| Events      |    unknown    |    unknown    |   unknown   |    nothing   |                      is_live                      |

When filtering with `#where`, use the corresponding id of a role, a region, a team, …, not the corresponding name.

## Caching

As you're restricted in numbers of requests to the API, there's a simple caching mechanism built-in. In order to enable caching, call `MasterLeague.enable_caching`. This will cache every HTTP request/response you send against the API in ~/.config/master_league_cache.yml. When you try to query the API with an already made request, you get the cached response and don't actually query the API.

If you want disable caching after enabling it, call `MasterLeague.disable_caching`. If you want to clear the cache, call `MasterLeague.cache.clear`.

## Authentication

As I don't have a valid premium access, authentication is missing.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tbuehlmann/master_league.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
