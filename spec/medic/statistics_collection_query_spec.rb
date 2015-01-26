describe "Medic::StatisticsCollectionQuery" do

  before do
    query_params = { type: :step_count, options: :sum, interval: :day }
    @subject = Medic::StatisticsCollectionQuery.new query_params do |query, collection, error|
      @block_contents = [query, collection, error]
    end

    query_params2 = { type: :step_count, options: :sum, interval: :day, update: true }
    @subject_with_update = Medic::StatisticsCollectionQuery.new query_params2 do |query, collection, error|
      @block_contents = [query, collection, error]
    end
  end

  after do
    @block_contents = nil
  end

  it "is a subclass of HKStatisticsCollectionQuery" do
    @subject.should.be.kind_of? HKStatisticsCollectionQuery
  end

  describe "initialize" do
    it "sets initialResultsHandler when given block" do
      @subject.initialResultsHandler.call(:query, :collection, :error)
      @block_contents.should == [:query, :collection, :error]
    end

    context "when :update is given" do
      it "sets statisticsUpdateHandler when given block" do
        @subject_with_update.statisticsUpdateHandler.call(:query, :statistics, :collection, :error)
        @block_contents.should == [:query, :collection, :error]
      end
    end

    context "when :update isn't given" do
      it "doesn't set statisticsUpdateHandler when given block" do
        @subject.statisticsUpdateHandler.should == nil
        @block_contents.should == nil
      end
    end
  end

  describe "#initial_results_handler=" do
    it "sets initialResultsHandler with callback" do
      @subject.initialResultsHandler.should.respond_to? :call
    end
  end

  describe "#statistics_update_handler=" do
    it "sets statisticsUpdateHandler with callback" do
      @subject_with_update.statisticsUpdateHandler.should.respond_to? :call
    end
  end

end
