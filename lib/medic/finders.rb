module Medic
  module Finders

    def observe(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::ObserverQuery.new query_params do |query, completion, error|
        block.call(completion, error)
      end
      Medic.execute(query)
    end

    def find_sources(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::SourceQuery.new query_params do |query, results, error|
        sources = results ? results.allObjects.map{ |source| source.name.to_s } : []
        block.call(sources)
      end
      Medic.execute(query)
    end

    def find_samples(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::SampleQuery.new query_params do |query, results, error|
        block.call(samples_to_hashes(Array(results)))
      end
      Medic.execute(query)
    end

  private

    def samples_to_hashes(samples)
      samples.map do |sample|
        h = {}
        h[:uuid] = sample.UUID
        h[:metadata] = sample.metadata
        h[:source] = sample.source.name
        h[:start_date] = sample.startDate
        h[:end_date] = sample.endDate
        h[:sample_type] = sample.sampleType
        h[:category_type] = sample.categoryType if sample.respond_to?(:categoryType)
        h[:value] = sample.value if sample.respond_to?(:value)
        h[:correlation_type] = sample.correlationType if sample.respond_to?(:correlationType)
        h[:objects] = sample.objects if sample.respond_to?(:objects)
        h[:quantity] = sample.quantity if sample.respond_to?(:quantity)
        h[:quantity_type] = sample.quantityType if sample.respond_to?(:quantityType)
        h[:duration] = sample.duration if sample.respond_to?(:duration)
        h[:total_distance] = sample.totalDistance if sample.respond_to?(:totalDistance)
        h[:total_energy_burned] = sample.totalEnergyBurned if sample.respond_to?(:totalEnergyBurned)
        h[:workout_activity_type] = sample.workoutActivityType if sample.respond_to?(:workoutActivityType)
        h[:workout_events] = sample.workoutEvents  if sample.respond_to?(:workoutEvents)
        h
      end
    end

  end
end
