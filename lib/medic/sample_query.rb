module Medic
  class SampleQuery < HKSampleQuery

    include Medic::Types
    include Medic::Sort

    def initialize(args={}, block=Proc.new)
      type = object_type(args[:type])
      predicate = args[:predicate]
      limit = args[:limit] || 0 # no limit
      sort = sort_descriptors(args[:sort_descriptors]) if args[:sort_descriptors]
      sort ||= sort_descriptors(args[:sort_by]) if args[:sort_by]
      sort ||= sort_descriptors(args[:sort]) if args[:sort]

      initWithSampleType(type, predicate: predicate, limit: limit, sortDescriptors: sort, resultsHandler: block)
    end

  end
end
