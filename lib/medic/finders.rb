module Medic
  module Finders

    def observe(type, predicate=nil, block=Proc.new)
      query = Medic::ObserverQuery.new type: type, predicate: predicate do |query, completion, error|
        block.call(completion, error)
      end
      Medic.execute(query)
    end

  end
end
