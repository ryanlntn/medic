describe "Medic::StatisticsQuery" do

  before do
    @subject = Medic::StatisticsQuery.new type: :step_count, options: :sum do |query, results, error|
    end
  end

  it "is a subclass of HKStatisticsQuery" do
    @subject.should.be.kind_of? HKStatisticsQuery
  end

  # it "passes the correct args" do
  #   @subject.mock! 'initWithQuantityType:quantitySamplePredicate:options:completionHandler' do |type, predicate, options, comp|
  #     type.should.be.kind_of? HKQuantityType
  #     predicate.should.be.kind_of? NSPredicate
  #     options.should.be.kind_of? HKStatisticsOptions
  #     comp.should.respond_to? :call
  #   end
  # end

end
