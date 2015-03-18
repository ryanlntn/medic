describe Medic::StatisticsQueryBuilder do

  before do
    @subject = Medic::StatisticsQueryBuilder.new type: :step_count, options: :sum do |query, results, error|
    end
  end

  it "has a query getter that returns an HKStatisticsQuery" do
    @subject.query.should.be.kind_of? HKStatisticsQuery
  end

end
