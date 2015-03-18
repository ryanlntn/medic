describe Medic::Types do

  before do
    @subject = Object.new
    @subject.extend(Medic::Types)
  end

  describe "#object_type" do
    it "returns the correct object type for symbol" do
      @subject.object_type(:step_count).should.be.kind_of? HKQuantityType
      @subject.object_type(:food).should.be.kind_of? HKCorrelationType
      @subject.object_type(:blood_type).should.be.kind_of? HKCharacteristicType
      @subject.object_type(:sleep_analysis).should.be.kind_of? HKCategoryType
      @subject.object_type(:workout).should.be.kind_of? HKWorkoutType
    end
  end

  describe "#type_identifier" do
    it "returns the correct type identifier for symbol" do
      @subject.type_identifier(:body_mass_index).should == HKQuantityTypeIdentifierBodyMassIndex
      @subject.type_identifier(:body_fat_percentage).should == HKQuantityTypeIdentifierBodyFatPercentage
      @subject.type_identifier(:height).should == HKQuantityTypeIdentifierHeight
      @subject.type_identifier(:body_mass).should == HKQuantityTypeIdentifierBodyMass
      @subject.type_identifier(:lean_body_mass).should == HKQuantityTypeIdentifierLeanBodyMass
      @subject.type_identifier(:step_count).should == HKQuantityTypeIdentifierStepCount
      @subject.type_identifier(:distance_walking_running).should == HKQuantityTypeIdentifierDistanceWalkingRunning
      @subject.type_identifier(:distance_cycling).should == HKQuantityTypeIdentifierDistanceCycling
      @subject.type_identifier(:basal_energy_burned).should == HKQuantityTypeIdentifierBasalEnergyBurned
      @subject.type_identifier(:active_energy_burned).should == HKQuantityTypeIdentifierActiveEnergyBurned
      @subject.type_identifier(:flights_climbed).should == HKQuantityTypeIdentifierFlightsClimbed
      @subject.type_identifier(:nike_fuel).should == HKQuantityTypeIdentifierNikeFuel
      @subject.type_identifier(:heart_rate).should == HKQuantityTypeIdentifierHeartRate
      @subject.type_identifier(:body_temperature).should == HKQuantityTypeIdentifierBodyTemperature
      @subject.type_identifier(:blood_pressure_systolic).should == HKQuantityTypeIdentifierBloodPressureSystolic
      @subject.type_identifier(:blood_pressure_diastolic).should == HKQuantityTypeIdentifierBloodPressureDiastolic
      @subject.type_identifier(:respiratory_rate).should == HKQuantityTypeIdentifierRespiratoryRate
      @subject.type_identifier(:oxygen_saturation).should == HKQuantityTypeIdentifierOxygenSaturation
      @subject.type_identifier(:peripheral_perfusion_index).should == HKQuantityTypeIdentifierPeripheralPerfusionIndex
      @subject.type_identifier(:blood_glucose).should == HKQuantityTypeIdentifierBloodGlucose
      @subject.type_identifier(:number_of_times_fallen).should == HKQuantityTypeIdentifierNumberOfTimesFallen
      @subject.type_identifier(:electrodermal_activity).should == HKQuantityTypeIdentifierElectrodermalActivity
      @subject.type_identifier(:inhaler_usage).should == HKQuantityTypeIdentifierInhalerUsage
      @subject.type_identifier(:blood_alcohol_content).should == HKQuantityTypeIdentifierBloodAlcoholContent
      @subject.type_identifier(:forced_vital_capacity).should == HKQuantityTypeIdentifierForcedVitalCapacity
      @subject.type_identifier(:forced_expiratory_volume1).should == HKQuantityTypeIdentifierForcedExpiratoryVolume1
      @subject.type_identifier(:peak_expiratory_flow_rate).should == HKQuantityTypeIdentifierPeakExpiratoryFlowRate
      @subject.type_identifier(:dietary_biotin).should == HKQuantityTypeIdentifierDietaryBiotin
      @subject.type_identifier(:dietary_caffeine).should == HKQuantityTypeIdentifierDietaryCaffeine
      @subject.type_identifier(:dietary_calcium).should == HKQuantityTypeIdentifierDietaryCalcium
      @subject.type_identifier(:dietary_carbohydrates).should == HKQuantityTypeIdentifierDietaryCarbohydrates
      @subject.type_identifier(:dietary_chloride).should == HKQuantityTypeIdentifierDietaryChloride
      @subject.type_identifier(:dietary_cholesterol).should == HKQuantityTypeIdentifierDietaryCholesterol
      @subject.type_identifier(:dietary_chromium).should == HKQuantityTypeIdentifierDietaryChromium
      @subject.type_identifier(:dietary_copper).should == HKQuantityTypeIdentifierDietaryCopper
      @subject.type_identifier(:dietary_energy_consumed).should == HKQuantityTypeIdentifierDietaryEnergyConsumed
      @subject.type_identifier(:dietary_fat_monounsaturated).should == HKQuantityTypeIdentifierDietaryFatMonounsaturated
      @subject.type_identifier(:dietary_fat_polyunsaturated).should == HKQuantityTypeIdentifierDietaryFatPolyunsaturated
      @subject.type_identifier(:dietary_fat_saturated).should == HKQuantityTypeIdentifierDietaryFatSaturated
      @subject.type_identifier(:dietary_fat_total).should == HKQuantityTypeIdentifierDietaryFatTotal
      @subject.type_identifier(:dietary_fiber).should == HKQuantityTypeIdentifierDietaryFiber
      @subject.type_identifier(:dietary_folate).should == HKQuantityTypeIdentifierDietaryFolate
      @subject.type_identifier(:dietary_iodine).should == HKQuantityTypeIdentifierDietaryIodine
      @subject.type_identifier(:dietary_iron).should == HKQuantityTypeIdentifierDietaryIron
      @subject.type_identifier(:dietary_magnesium).should == HKQuantityTypeIdentifierDietaryMagnesium
      @subject.type_identifier(:dietary_manganese).should == HKQuantityTypeIdentifierDietaryManganese
      @subject.type_identifier(:dietary_molybdenum).should == HKQuantityTypeIdentifierDietaryMolybdenum
      @subject.type_identifier(:dietary_niacin).should == HKQuantityTypeIdentifierDietaryNiacin
      @subject.type_identifier(:dietary_pantothenic_acid).should == HKQuantityTypeIdentifierDietaryPantothenicAcid
      @subject.type_identifier(:dietary_phosphorus).should == HKQuantityTypeIdentifierDietaryPhosphorus
      @subject.type_identifier(:dietary_potassium).should == HKQuantityTypeIdentifierDietaryPotassium
      @subject.type_identifier(:dietary_protein).should == HKQuantityTypeIdentifierDietaryProtein
      @subject.type_identifier(:dietary_riboflavin).should == HKQuantityTypeIdentifierDietaryRiboflavin
      @subject.type_identifier(:dietary_selenium).should == HKQuantityTypeIdentifierDietarySelenium
      @subject.type_identifier(:dietary_sodium).should == HKQuantityTypeIdentifierDietarySodium
      @subject.type_identifier(:dietary_sugar).should == HKQuantityTypeIdentifierDietarySugar
      @subject.type_identifier(:dietary_thiamin).should == HKQuantityTypeIdentifierDietaryThiamin
      @subject.type_identifier(:dietary_vitamin_a).should == HKQuantityTypeIdentifierDietaryVitaminA
      @subject.type_identifier(:dietary_vitamin_b12).should == HKQuantityTypeIdentifierDietaryVitaminB12
      @subject.type_identifier(:dietary_vitamin_b6).should == HKQuantityTypeIdentifierDietaryVitaminB6
      @subject.type_identifier(:dietary_vitamin_c).should == HKQuantityTypeIdentifierDietaryVitaminC
      @subject.type_identifier(:dietary_vitamin_d).should == HKQuantityTypeIdentifierDietaryVitaminD
      @subject.type_identifier(:dietary_vitamin_e).should == HKQuantityTypeIdentifierDietaryVitaminE
      @subject.type_identifier(:dietary_vitamin_k).should == HKQuantityTypeIdentifierDietaryVitaminK
      @subject.type_identifier(:dietary_zinc).should == HKQuantityTypeIdentifierDietaryZinc
      @subject.type_identifier(:sleep_analysis).should == HKCategoryTypeIdentifierSleepAnalysis
      @subject.type_identifier(:biological_sex).should == HKCharacteristicTypeIdentifierBiologicalSex
      @subject.type_identifier(:blood_type).should == HKCharacteristicTypeIdentifierBloodType
      @subject.type_identifier(:date_of_birth).should == HKCharacteristicTypeIdentifierDateOfBirth
      @subject.type_identifier(:blood_pressure).should == HKCorrelationTypeIdentifierBloodPressure
      @subject.type_identifier(:food).should == HKCorrelationTypeIdentifierFood
      @subject.type_identifier(:workout).should == HKWorkoutTypeIdentifier
    end
  end

end
