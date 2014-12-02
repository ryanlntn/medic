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

  describe ".authorized?" do
    it "delegates to Medic::Store" do
      @store.stub! 'authorized?' do |sym|
        sym.should.be.kind_of? Symbol
      end
      Medic.authorized? :step_count
    end

    it "has an .is_authorized? alias" do
      Medic.method(:is_authorized?).should == Medic.method(:authorized?)
    end

    it "has an .authorized_for? alias" do
      Medic.method(:authorized_for?).should == Medic.method(:authorized?)
    end

    it "has an .is_authorized_for? alias" do
      Medic.method(:is_authorized_for?).should == Medic.method(:authorized?)
    end
  end

  describe ".biological_sex" do
    it "delegates to Medic::Store" do
      @store.stub! 'biological_sex' { true }
      Medic.biological_sex.should == true
    end
  end

  describe ".blood_type" do
    it "delegates to Medic::Store" do
      @store.stub! 'blood_type' { true }
      Medic.blood_type.should == true
    end
  end

  describe ".date_of_birth" do
    it "delegates to Medic::Store" do
      @store.stub! 'date_of_birth' { true }
      Medic.date_of_birth.should == true
    end
  end

  describe ".delete" do
    it "delegates to Medic::Store" do
      @store.stub! 'delete' do |hk_object, block|
        hk_object.should == :hk_object
        block.should.respond_to? :call
      end
      Medic.delete(:hk_object){|success, error|}
    end
  end

  describe ".save" do
    it "delegates to Medic::Store" do
      @store.stub! 'save' do |hk_objects, block|
        hk_objects.should == :hk_objects
        block.should.respond_to? :call
      end
      Medic.save(:hk_objects){|success, error|}
    end
  end

  describe ".execute" do
    it "delegates to Medic::Store" do
      @store.stub! 'execute' do |query|
        query.should == :query
      end
      Medic.execute(:query)
    end

    it "has an .execute_query alias" do
      Medic.method(:execute_query).should == Medic.method(:execute)
    end
  end

  describe ".stop" do
    it "delegates to Medic::Store" do
      @store.stub! 'stop' do |query|
        query.should == :query
      end
      Medic.stop(:query)
    end

    it "has an .stop_query alias" do
      Medic.method(:stop_query).should == Medic.method(:stop)
    end
  end

end
