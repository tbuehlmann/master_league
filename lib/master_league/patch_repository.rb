module MasterLeague
  class PatchRepository < Repository
    self.path = 'patches/'

    def order(order)
      raise 'The Patches endpoint does not allow ordering'
    end

    private

    def instantiate_records(patches_json)
      patches_json.map { |patch_json| instantiate_record(patch_json) }
    end

    def instantiate_record(patch_json)
      Patch.new(patch_json)
    end
  end
end
