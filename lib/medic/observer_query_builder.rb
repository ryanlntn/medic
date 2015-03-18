module Medic
  class ObserverQueryBuilder
    attr_reader :params
    attr_reader :query

    include Medic::Types
    include Medic::Predicate

    def initialize(args={}, block=Proc.new)
      @params = args
      @query = HKObserverQuery.alloc.initWithSampleType(object_type(args[:type]),
        predicate: predicate(args),
        updateHandler: block
      )
    end

  end
end
