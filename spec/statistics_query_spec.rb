describe "Medic::StatisticsQuery" do

  before do
    @subject = Medic::StatisticsQuery.new type: :step_count, options: :sum do |query, results, error|
    end
  end

  it "is a subclass of HKStatisticsQuery" do
    @subject.should.be.kind_of? HKStatisticsQuery
  end

end
