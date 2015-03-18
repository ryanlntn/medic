module Medic
  class SourceQueryBuilder
    attr_reader :params
    attr_reader :query

    include Medic::Types
    include Medic::Predicate

    def initialize(args={}, block=Proc.new)
      @params = args
      @query = HKSourceQuery.alloc.initWithSampleType(object_type(args[:type]),
        samplePredicate: predicate(args),
        completionHandler: block
      )
    end

  end
end
