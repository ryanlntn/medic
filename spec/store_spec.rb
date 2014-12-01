describe "Medic::Store" do

  before do
    @subject = Medic::Store.new
  end

  describe "#authorize" do
    it "calls #requestAuthorizationToShareTypes:readTypes:completion with correct args" do
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
    it "calls #authorizationStatusForType with correct args" do
      @subject.mock! 'authorizationStatusForType' do |type|
        type.should.be.kind_of? HKObjectType
        false
      end
      @subject.authorized?(:step_count).should == false
    end

    it "has an #is_authorized? alias" do
      @subject.method(:is_authorized?).should == @subject.method(:authorized?)
    end

    it "has an #authorized_for? alias" do
      @subject.method(:authorized_for?).should == @subject.method(:authorized?)
    end

    it "has an #is_authorized_for? alias" do
      @subject.method(:is_authorized_for?).should == @subject.method(:authorized?)
    end
  end

  describe "#biological_sex" do
    it "calls #biologicalSexWithError with correct args" do
      @subject.mock! 'biologicalSexWithError' do |error|
        error.should.be.kind_of? Pointer
        mock(:biologicalSex, return: HKBiologicalSexFemale)
      end
      @subject.biological_sex.should == :female
    end
  end

  describe "#blood_type" do
    it "calls #bloodTypeWithError with correct args" do
      @subject.mock! 'bloodTypeWithError' do |error|
        error.should.be.kind_of? Pointer
        mock(:bloodType, return: HKBloodTypeONegative)
      end
      @subject.blood_type.should == :o_negative
    end
  end

  describe "#date_of_birth" do
    it "calls #dateOfBirthWithError with correct args" do
      @subject.mock! 'dateOfBirthWithError' do |error|
        error.should.be.kind_of? Pointer
        true
      end
      @subject.date_of_birth.should == true
    end
  end

  describe "#save" do
    it "calls #saveObject:withCompletion with correct args" do
      @subject.mock! 'saveObjects:withCompletion' do |object, comp|
        object.first.should.be.kind_of? HKObjectType
        comp.should.respond_to? :call
      end
      steps = @subject.object_type(:step_count)
      @subject.save(steps){|success, error|}
    end
  end

  describe "#delete" do
    it "calls #deleteObject:withCompletion with correct args" do
      @subject.mock! 'deleteObject:withCompletion' do |object, comp|
        object.should.be.kind_of? HKObjectType
        comp.should.respond_to? :call
      end
      steps = @subject.object_type(:step_count)
      @subject.delete(steps){|success, error|}
    end
  end

  describe "#execute" do
    it "calls #executeQuery with correct args" do
      @subject.mock! 'executeQuery' do |query|
        query.should.be.kind_of? HKQuery
      end
      query = HKSampleQuery.alloc.initWithSampleType(@subject.object_type(:step_count), predicate:nil, limit:HKObjectQueryNoLimit, sortDescriptors:nil, resultsHandler:->(q,r,e){})
      @subject.execute(query)
    end

    it "has an #execute_query alias" do
      @subject.method(:execute_query).should == @subject.method(:execute)
    end
  end

  describe "#stop" do
    it "calls #stopQuery with correct args" do
      @subject.mock! 'stopQuery' do |query|
        query.should.be.kind_of? HKQuery
      end
      query = HKSampleQuery.alloc.initWithSampleType(@subject.object_type(:step_count), predicate:nil, limit:HKObjectQueryNoLimit, sortDescriptors:nil, resultsHandler:->(q,r,e){})
      @subject.stop(query)
    end

    it "has an #stop_query alias" do
      @subject.method(:stop_query).should == @subject.method(:stop)
    end
  end

  describe "#enable_background_delivery" do
    it "calls #enableBackgroundDeliveryForType with correct args" do
      @subject.mock! 'enableBackgroundDeliveryForType:frequency:withCompletion' do |type, freq, comp|
        type.should.be.kind_of? HKObjectType
        freq.should == HKUpdateFrequencyWeekly
        comp.should.respond_to? :call
      end
      @subject.enable_background_delivery(:step_count, :weekly){|success, error|}
    end

    it "has an #enable_background_delivery_for alias" do
      @subject.method(:enable_background_delivery_for).should == @subject.method(:enable_background_delivery)
    end
  end

  describe "#disable_background_delivery" do
    it "calls #disableBackgroundDeliveryForType:withCompletion with correct args" do
      @subject.mock! 'disableBackgroundDeliveryForType:withCompletion' do |type, comp|
        type.should.be.kind_of? HKObjectType
        comp.should.respond_to? :call
      end
      @subject.disable_background_delivery(:step_count){|success, error|}
    end

    it "has a #disable_background_delivery_for alias" do
      @subject.method(:disable_background_delivery_for).should == @subject.method(:disable_background_delivery)
    end
  end

  describe "#disable_all_background_delivery" do
    it "calls #disableAllBackgroundDeliveryWithCompletion with correct args" do
      @subject.mock! 'disableAllBackgroundDeliveryWithCompletion' do |comp|
        comp.should.respond_to? :call
      end
      @subject.disable_all_background_delivery{|success, error|}
    end
  end

end
