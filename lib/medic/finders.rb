module Medic
  module Finders

    def observe(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::ObserverQueryBuilder.new query_params do |query, completion, error|
        block.call(completion, error)
      end.query
      Medic.execute(query)
    end

    def find_sources(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::SourceQueryBuilder.new query_params do |query, results, error|
        sources = results ? results.allObjects.map{ |source| source.name.to_s } : []
        block.call(sources)
      end.query
      Medic.execute(query)
    end

    def find_samples(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::SampleQueryBuilder.new query_params do |query, results, error|
        block.call(samples_to_hashes(Array(results)))
      end.query
      Medic.execute(query)
    end

    def find_correlations(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::CorrelationQueryBuilder.new query_params do |query, correlations, error|
        block.call(samples_to_hashes(Array(correlations)))
      end.query
      Medic.execute(query)
    end

    def find_anchored(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::AnchoredObjectQueryBuilder.new query_params do |query, results, new_anchor, error|
        block.call(samples_to_hashes(Array(results)), new_anchor)
      end.query
      Medic.execute(query)
    end

    def find_statistics(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::StatisticsQueryBuilder.new query_params do |query, statistics, error|
        block.call(statistics_to_hash(statistics)) if statistics
      end.query
      Medic.execute(query)
    end

    def find_statistics_collection(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::StatisticsCollectionQueryBuilder.new query_params do |query, collection, error|
        from_date = options[:from_date] || options[:from] || options[:start_date] || collection.anchorDate
        to_date = options[:to_date] || options[:to] || options[:end_date] || NSDate.date
        formatted_stats = []
        if collection
          collection.enumerateStatisticsFromDate(from_date, toDate: to_date, withBlock: ->(result, stop){
            formatted_stats << statistics_to_hash(result)
          })
        end
        block.call(formatted_stats)
      end.query

      Medic.execute(query)
    end

  private

    def samples_to_hashes(samples)
      samples.map do |sample|
        h = {}
        h[:uuid] = sample.UUID.UUIDString
        h[:metadata] = sample.metadata
        h[:source] = sample.source.name
        h[:start_date] = sample.startDate
        h[:end_date] = sample.endDate
        h[:sample_type] = Medic::Types::TYPE_IDENTIFIERS.index(sample.sampleType.identifier)

        if sample.respond_to?(:categoryType) && sample.respond_to?(:value)
          h[:category_type] = Medic::Types::TYPE_IDENTIFIERS.index(sample.categoryType.identifier)
          h[:value] = [:in_bed, :asleep][sample.value] # SleepAnalysis is the only category type at the moment
        end

        if sample.respond_to?(:correlationType) && sample.respond_to?(:objects)
          h[:correlation_type] = Medic::Types::TYPE_IDENTIFIERS.index(sample.correlationType.identifier)
          h[:objects] = samples_to_hashes(Array(sample.objects.allObjects))
        end

        if sample.respond_to?(:quantity) && sample.respond_to?(:quantityType)
          h[:quantity] = sample.quantity.doubleValueForUnit(sample.quantityType.canonicalUnit)
          h[:quantity_type] = Medic::Types::TYPE_IDENTIFIERS.index(sample.quantityType.identifier)
          h[:canonical_unit] = sample.quantityType.canonicalUnit.unitString
        end

        h[:duration] = sample.duration if sample.respond_to?(:duration)
        h[:total_distance] = sample.totalDistance if sample.respond_to?(:totalDistance)
        h[:total_energy_burned] = sample.totalEnergyBurned if sample.respond_to?(:totalEnergyBurned)
        h[:workout_activity_type] = sample.workoutActivityType if sample.respond_to?(:workoutActivityType)
        h[:workout_events] = sample.workoutEvents  if sample.respond_to?(:workoutEvents)
        h
      end
    end

    def statistics_to_hash(stats)
      h = {}
      h[:start_date] = stats.startDate
      h[:end_date] = stats.endDate
      h[:sources] = stats.sources.map(&:name) if stats.sources
      h[:quantity_type] = Medic::Types::TYPE_IDENTIFIERS.index(stats.quantityType.identifier)
      h[:canonical_unit] = stats.quantityType.canonicalUnit.unitString
      h[:data_count] = stats.dataCount
      h[:average] = stats.averageQuantity.doubleValueForUnit(stats.quantityType.canonicalUnit) if stats.averageQuantity
      h[:minimum] = stats.minimumQuantity.doubleValueForUnit(stats.quantityType.canonicalUnit) if stats.minimumQuantity
      h[:maximum] = stats.maximumQuantity.doubleValueForUnit(stats.quantityType.canonicalUnit) if stats.maximumQuantity
      h[:sum] = stats.sumQuantity.doubleValueForUnit(stats.quantityType.canonicalUnit) if stats.sumQuantity
      h[:average_by_source] = stats.averageQuantityBySource.doubleValueForUnit(stats.quantityType.canonicalUnit) if stats.averageQuantityBySource
      h[:minimum_by_source] = stats.minimumQuantityBySource.doubleValueForUnit(stats.quantityType.canonicalUnit) if stats.minimumQuantityBySource
      h[:maximum_by_source] = stats.maximumQuantityBySource.doubleValueForUnit(stats.quantityType.canonicalUnit) if stats.maximumQuantityBySource
      h[:sum_by_source] = stats.sumQuantityBySource.doubleValueForUnit(stats.quantityType.canonicalUnit) if stats.sumQuantityBySource
      h
    end

  end
end
