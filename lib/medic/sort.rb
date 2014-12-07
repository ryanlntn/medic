module Medic
  module Sort

    SORT_IDENTIFIERS = {
      start_date: HKSampleSortIdentifierStartDate,
      end_date: HKSampleSortIdentifierEndDate
    }

    def sort_descriptors(symbols)
      Array(symbols).map{ |sym| sort_identifier(sym) }
    end

    def sort_identifier(sort_id)
      sort_id.is_a?(Symbol) ? SORT_IDENTIFIERS[sort_id] : sort_id
    end

  end
end
