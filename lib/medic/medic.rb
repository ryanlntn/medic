module Medic
  class << self

    def available?
      Medic::Store.available?
    end
    alias_method :is_available?, :available?

    def authorize(types, block=Proc.new)
      Medic::Store.shared.authorize(types, block)
    end

  end
end

