describe "Medic" do

  before do
    @store = Medic::Store.shared
  end

  describe ".available?" do
    it "determines if HealthKit is available" do
      Medic.available?.should == true
    end

    it "has an .is_available? alias" do
      Medic.is_available?.should == true
    end
  end

  describe ".authorize" do
    it "delegates to Medic::Store" do
      @store.stub! 'authorize' do |types, block|
        types.should.be.kind_of? Hash
        block.should.respond_to? :call
      end
      Medic.authorize(read: :step_count){|success, error|}
    end
  end

end
