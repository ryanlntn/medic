describe "Medic::StatisticsCollectionQuery" do

  before do
    @interval = NSDateComponents.new
    @interval.day = 1
    @subject = Medic::StatisticsCollectionQuery.new(type: :step_count, options: :sum, interval: @interval)
  end

  it "is a subclass of HKStatisticsCollectionQuery" do
    @subject.should.be.kind_of? HKStatisticsCollectionQuery
  end

  describe "#initial_results_handler=" do
    it "sets initialResultsHandler with callback" do
      @subject.initial_results_handler = ->(){}
      @subject.initialResultsHandler.should.respond_to? :call
    end
  end

  describe "#statistics_update_handler=" do
    it "sets statisticsUpdateHandler with callback" do
      @subject.statistics_update_handler = ->(){}
      @subject.statisticsUpdateHandler.should.respond_to? :call
    end
  end

end
