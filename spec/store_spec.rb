describe "Medic::Store" do

  before do
    @subject = Medic::Store.new
  end

  describe "#authorize" do
    it "calls requestAuthorizationToShareTypes:readTypes:completion with correct args" do
      @subject.mock! 'requestAuthorizationToShareTypes:readTypes:completion' do |share, read, comp|
        share.should.be.kind_of? NSSet
        read.should.be.kind_of? NSSet
        comp.should.respond_to? :call
        true
      end
      @subject.authorize(read: [:step_count]){|success, error|}.should == true
    end
  end

  describe "#authorized?" do
    it "calls authorizationStatusForType with correct args" do
      @subject.mock! 'authorizationStatusForType' do |type|
        type.should.be.kind_of? HKObjectType
        false
      end
      @subject.authorized?(:step_count).should == false
    end
  end

end
