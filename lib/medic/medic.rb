module Medic
  class << self

    def available?
      Medic::Store.available?
    end
    alias_method :is_available?, :available?

  end
end

