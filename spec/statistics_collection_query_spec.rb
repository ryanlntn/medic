describe "Medic::StatisticsCollectionQuery" do

  before do
    @interval = NSDateComponents.new
    @interval.day = 1
    @subject = Medic::StatisticsCollectionQuery.new(type: :step_count, options: :sum, interval: @interval)
  end

  it "is a subclass of HKStatisticsCollectionQuery" do
    @subject.should.be.kind_of? HKStatisticsCollectionQuery
  end

end
