module Medic
  class SampleQuery < HKSampleQuery

    include Medic::Types
    include Medic::Sort

    def initialize(args={}, block=Proc.new)
      type = object_type(args[:type])
      predicate = args[:predicate]
      limit = args[:limit] || HKObjectQueryNoLimit
      sort = args[:sort_descriptors] || args[:sort_by] || args[:sort_asc] || args[:sort]
      sort = sort_descriptors(sort) if sort
      sort ||= sort_descriptors(args[:sort_desc], false) if args[:sort_desc]

      initWithSampleType(type, predicate: predicate, limit: limit, sortDescriptors: sort, resultsHandler: block)
    end

  end
end
