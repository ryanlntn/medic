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

    # def find_samples(type, options={}, block=Proc.new)
    #   query_params = options.merge(type: type)
    #   query = Medic::SampleQuery.new query_params do |query, results, error|
    #     samples = Array(results)
    #     block.call(samples)
    #   end
    #   Medic.execute(query)
    # end

  end
end
