module Medic
  class AnchoredObjectQuery < HKAnchoredObjectQuery

    include Medic::Types
    include Medic::Predicate

    def initialize(args={}, block=Proc.new)
      type = object_type(args[:type])
      predicate = predicate(args)
      anchor = args[:anchor_date] || args[:anchor] || args[:date] || HKAnchoredObjectQueryNoAnchor
      limit = args[:limit] || HKObjectQueryNoLimit
      initWithType(type, predicate: predicate, anchor: anchor, limit: limit, completionHandler: block)
    end

  end
end
