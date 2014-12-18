module Medic
  module QueryOptions

    QUERY_OPTIONS = {
      none: HKQueryOptionNone,
      strict_start_date: HKQueryOptionStrictStartDate,
      strict_end_date: HKQueryOptionStrictEndDate
    }

    def query_options(symbols)
      options = 0
      Array(symbols).each do |option|
        options = options | query_option(option)
      end
      options
    end

    def query_option(option)
      option.is_a?(Symbol) ? QUERY_OPTIONS[option] : option
    end

  end
end
