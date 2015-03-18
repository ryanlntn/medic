describe Medic do

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

  describe ".enable_background_delivery" do
    it "delegates to Medic::Store" do
      @store.stub! 'enable_background_delivery' do |type, freq, block|
        type.should == :type
        freq.should == :freq
        block.should.respond_to? :call
      end
      Medic.enable_background_delivery(:type, :freq){|success, error|}
    end

    it "has a .enable_background_delivery_for alias" do
      Medic.method(:enable_background_delivery_for).should == Medic.method(:enable_background_delivery)
    end
  end

  describe ".disable_background_delivery" do
    it "delegates to Medic::Store" do
      @store.stub! 'disable_background_delivery' do |type, block|
        type.should == :type
        block.should.respond_to? :call
      end
      Medic.disable_background_delivery(:type){|success, error|}
    end

    it "has a .disable_background_delivery_for alias" do
      Medic.method(:disable_background_delivery_for).should == Medic.method(:disable_background_delivery)
    end
  end

  describe ".disable_all_background_delivery" do
    it "delegates to Medic::Store" do
      @store.stub! 'disable_all_background_delivery' do |block|
        block.should.respond_to? :call
      end
      Medic.disable_all_background_delivery{|success, error|}
    end
  end

end
