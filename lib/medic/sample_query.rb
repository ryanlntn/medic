module Medic
  class SampleQuery < HKSampleQuery

    include Medic::Types
    include Medic::Predicate
    include Medic::Sort

    def initialize(args={}, block=Proc.new)
      sort = args[:sort_descriptors] || args[:sort_by] || args[:sort_asc] || args[:sort]
      sort = sort_descriptors(sort) if sort
      sort ||= sort_descriptors(args[:sort_desc], false) if args[:sort_desc]

      self.initWithSampleType(object_type(args[:type]),
        predicate: predicate(args),
        limit: args[:limit] || HKObjectQueryNoLimit,
        sortDescriptors: sort,
        resultsHandler: block
      )
    end

  end
end
