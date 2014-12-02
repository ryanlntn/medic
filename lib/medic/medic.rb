module Medic
  class << self

    def available?
      Medic::Store.available?
    end
    alias_method :is_available?, :available?

    def authorize(types, block=Proc.new)
      Medic::Store.shared.authorize(types, block)
    end

    def authorized?(sym)
      Medic::Store.shared.authorized?(sym)
    end
    alias_method :authorized_for?, :authorized?
    alias_method :is_authorized?, :authorized?
    alias_method :is_authorized_for?, :authorized?

  end
end

