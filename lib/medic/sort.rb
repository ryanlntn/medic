module Medic
  module Sort

    SORT_IDENTIFIERS = {
      start_date: HKSampleSortIdentifierStartDate,
      end_date: HKSampleSortIdentifierEndDate
    }

    def sort_descriptors(symbols, ascending=true)
      Array(symbols).map do |sym|
        NSSortDescriptor.alloc.initWithKey(sort_identifier(sym), ascending: ascending)
      end
    end

    def sort_identifier(sort_id)
      sort_id.is_a?(Symbol) ? SORT_IDENTIFIERS[sort_id] : sort_id
    end

  end
end
