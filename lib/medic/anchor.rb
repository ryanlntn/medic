module Medic
  module Anchor

    NUMBER_WORDS = {
      'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
      'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9, 'ten' => 10, 'eleven' => 11,
      'twelve' => 12, 'thirteen' => 13, 'fourteen' => 14, 'fifteen' => 15, 'sixteen' => 16,
      'seventeen' => 17, 'eighteen' => 18, 'nineteen' => 19, 'twenty' => 20, 'thirty' => 30,
      'fourty' => 40, 'fifty' => 50, 'sixty' => 60, 'seventy' => 70, 'eighty' => 80,
      'ninety' => 90, 'hundred' => 100
    }

    def anchor_for_symbol(sym)
      return unless sym
      return sym if sym.to_s == '0'
      return sym if sym.is_a? Fixnum
      return sym if sym.is_a? NSDate
      parts = sym.to_s.gsub('_', ' ').split.reject{ |part| part == 'ago' }
      component = parts.pop.chomp('s')
      n = parts.map{|p| NUMBER_WORDS[p] || p.to_i}.reduce do |sum, p|
        if p == 100 && sum > 0
          sum * p
        else
          sum + p
        end
      end
      n ||= 1
      date_comp = NSDateComponents.new.send("#{component}=", -n)
      NSCalendar.currentCalendar.dateByAddingComponents(date_comp, toDate: NSDate.date, options: 0)
    end

  end
end
