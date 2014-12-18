module Medic
  module Predicate

    include Medic::QueryOptions

    def predicate(args={})
      return args if args.is_a? NSPredicate
      if args[:where]
        args[:where]
      elsif args[:predicate]
        args[:predicate]
      elsif args[:sample_predicate]
        args[:sample_predicate]
      elsif args[:uuid] || args[:uuids]
        uuids = Array(args[:uuid] || args[:uuids]).map{ |s| NSUUID.alloc.initWithUUIDString(s.to_s) }
        HKQuery.predicateForObjectsWithUUIDs(uuids)
      elsif args[:source] || args[:sources]
        HKQuery.predicateForObjectsFromSources(Array(args[:source] || args[:sources]))
      elsif args[:meta_data] && (args[:allowed_value] || args[:allowed_values])
        HKQuery.predicateForObjectsWithMetadataKey(args[:meta_data].to_s, allowedValues: Array(args[:allowed_value] || args[:allowed_values]))
      elsif args[:meta_data]
        HKQuery.predicateForObjectsWithMetadataKey(args[:meta_data].to_s)
      elsif args[:no_correlation]
        HKQuery.predicateForObjectsWithNoCorrelation
      elsif args[:start_date] && args[:end_date]
        options = query_options(args[:options]) || HKQueryOptionNone
        HKQuery.predicateForSamplesWithStartDate(args[:start_date], endDate: args[:end_date], options: options)
      elsif args[:workout]
        HKQuery.predicateForObjectsFromWorkout(args[:workout])
      elsif args[:workout_activity_type] || args[:activity_type]
        activity_type = args[:workout_activity_type] || args[:activity_type]
        HKQuery.predicateForWorkoutsWithWorkoutActivityType(activity_type)
      else
        nil
      end
    end

  end
end
