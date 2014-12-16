module Medic
  module Finders

    def observe(type, predicate=nil, block=Proc.new)
      query = Medic::ObserverQuery.new type: type, predicate: predicate do |query, completion, error|
        block.call(completion, error)
      end
      Medic.execute(query)
    end

    def find_sources(type, predicate=nil, block=Proc.new)
      query = Medic::SourceQuery.new type: type, predicate: predicate do |query, results, error|
        sources = results ? results.allObjects.map{ |source| source.name.to_s } : []
        block.call(sources)
      end
      Medic.execute(query)
    end

  end
end
