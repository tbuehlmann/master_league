module MasterLeague
  class Repository
    include Enumerable

    class << self
      attr_accessor :path
    end

    attr_accessor :order_value, :page_value, :limit_value

    def each(&block)
      records.each(&block)
    end

    def last
      records.last
    end

    def find(id)
      response = MasterLeague.fetch("#{self.class.path}#{id}/")
      instantiate_record(response)
    end

    def all
      clone
    end

    def order(order)
      clone.tap do |repository|
        unload
        repository.order_value = order
      end
    end

    def page(page)
      clone.tap do |repository|
        unload
        repository.page_value = page
      end
    end

    def limit(limit)
      clone.tap do |repository|
        unload
        repository.limit_value = limit
      end
    end

    def where(filters)
      clone.tap do |repository|
        unload
        repository.where_values.merge!(filters)
      end
    end

    def inspect
      entries = records.first(11).map!(&:inspect)
      entries[10] = '...' if entries.size == 11

      "#<#{self.class.name} [#{entries.join(', ')}]>"
    end

    private

    def where_values
      @where_values ||= {}
    end

    def load
      unless loaded?
        @records = fetch
        @loaded = true
      end

      self
    end

    def unload
      @loaded = false
      @records = nil
    end

    def loaded?
      !!@loaded
    end

    def fetch
      response = MasterLeague.fetch(self.class.path, where_values.merge(params))
      instantiate_records(response)
    end

    def instantiate_records(records_json)
      raise NotImplementedError
    end

    def instantiate_record(record_json)
      raise NotImplementedError
    end

    def params
      {}.tap do |params|
        params[:ordering] = @order_value if @order_value
        params[:page] = @page_value if @page_value
        params[:page_size] = @limit_value if @limit_value
      end
    end

    def records
      load
      @records
    end
  end
end
