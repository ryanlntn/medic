describe Medic::StatisticsOptions do

  before do
    @subject = Object.new
    @subject.extend(Medic::StatisticsOptions)
  end

  describe "#options_for_stat_query" do
    it "correctly calculates the value for options" do
      @subject.options_for_stat_query(:none).should == 0
      @subject.options_for_stat_query([:by_source, :sum]).should == 17
      @subject.options_for_stat_query([:average, :min, :max]).should == 14
    end
  end

  describe "#statistics_option" do
    it "returns the correct type identifier for symbol" do
      @subject.statistics_option(:none).should == HKStatisticsOptionNone
      @subject.statistics_option(:by_source).should == HKStatisticsOptionSeparateBySource
      @subject.statistics_option(:separate_by_source).should == HKStatisticsOptionSeparateBySource
      @subject.statistics_option(:average).should == HKStatisticsOptionDiscreteAverage
      @subject.statistics_option(:discrete_average).should == HKStatisticsOptionDiscreteAverage
      @subject.statistics_option(:min).should == HKStatisticsOptionDiscreteMin
      @subject.statistics_option(:discrete_min).should == HKStatisticsOptionDiscreteMin
      @subject.statistics_option(:max).should == HKStatisticsOptionDiscreteMax
      @subject.statistics_option(:discrete_max).should == HKStatisticsOptionDiscreteMax
      @subject.statistics_option(:sum).should == HKStatisticsOptionCumulativeSum
      @subject.statistics_option(:cumulative_sum).should == HKStatisticsOptionCumulativeSum
    end
  end

end
