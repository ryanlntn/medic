module Medic
  module Types

    TYPE_IDENTIFIERS = {
      body_mass_index: HKQuantityTypeIdentifierBodyMassIndex,
      body_fat_percentage: HKQuantityTypeIdentifierBodyFatPercentage,
      height: HKQuantityTypeIdentifierHeight,
      body_mass: HKQuantityTypeIdentifierBodyMass,
      lean_body_mass: HKQuantityTypeIdentifierLeanBodyMass,
      step_count: HKQuantityTypeIdentifierStepCount,
      distance_walking_running: HKQuantityTypeIdentifierDistanceWalkingRunning,
      distance_cycling: HKQuantityTypeIdentifierDistanceCycling,
      basal_energy_burned: HKQuantityTypeIdentifierBasalEnergyBurned,
      active_energy_burned: HKQuantityTypeIdentifierActiveEnergyBurned,
      flights_climbed: HKQuantityTypeIdentifierFlightsClimbed,
      nike_fuel: HKQuantityTypeIdentifierNikeFuel,
      heart_rate: HKQuantityTypeIdentifierHeartRate,
      body_temperature: HKQuantityTypeIdentifierBodyTemperature,
      blood_pressure_systolic: HKQuantityTypeIdentifierBloodPressureSystolic,
      blood_pressure_diastolic: HKQuantityTypeIdentifierBloodPressureDiastolic,
      respiratory_rate: HKQuantityTypeIdentifierRespiratoryRate,
      oxygen_saturation: HKQuantityTypeIdentifierOxygenSaturation,
      peripheral_perfusion_index: HKQuantityTypeIdentifierPeripheralPerfusionIndex,
      blood_glucose: HKQuantityTypeIdentifierBloodGlucose,
      number_of_times_fallen: HKQuantityTypeIdentifierNumberOfTimesFallen,
      electrodermal_activity: HKQuantityTypeIdentifierElectrodermalActivity,
      inhaler_usage: HKQuantityTypeIdentifierInhalerUsage,
      blood_alcohol_content: HKQuantityTypeIdentifierBloodAlcoholContent,
      forced_vital_capacity: HKQuantityTypeIdentifierForcedVitalCapacity,
      forced_expiratory_volume1: HKQuantityTypeIdentifierForcedExpiratoryVolume1,
      peak_expiratory_flow_rate: HKQuantityTypeIdentifierPeakExpiratoryFlowRate,
      dietary_biotin: HKQuantityTypeIdentifierDietaryBiotin,
      dietary_caffeine: HKQuantityTypeIdentifierDietaryCaffeine,
      dietary_calcium: HKQuantityTypeIdentifierDietaryCalcium,
      dietary_carbohydrates: HKQuantityTypeIdentifierDietaryCarbohydrates,
      dietary_chloride: HKQuantityTypeIdentifierDietaryChloride,
      dietary_cholesterol: HKQuantityTypeIdentifierDietaryCholesterol,
      dietary_chromium: HKQuantityTypeIdentifierDietaryChromium,
      dietary_copper: HKQuantityTypeIdentifierDietaryCopper,
      dietary_energy_consumed: HKQuantityTypeIdentifierDietaryEnergyConsumed,
      dietary_fat_monounsaturated: HKQuantityTypeIdentifierDietaryFatMonounsaturated,
      dietary_fat_polyunsaturated: HKQuantityTypeIdentifierDietaryFatPolyunsaturated,
      dietary_fat_saturated: HKQuantityTypeIdentifierDietaryFatSaturated,
      dietary_fat_total: HKQuantityTypeIdentifierDietaryFatTotal,
      dietary_fiber: HKQuantityTypeIdentifierDietaryFiber,
      dietary_folate: HKQuantityTypeIdentifierDietaryFolate,
      dietary_iodine: HKQuantityTypeIdentifierDietaryIodine,
      dietary_iron: HKQuantityTypeIdentifierDietaryIron,
      dietary_magnesium: HKQuantityTypeIdentifierDietaryMagnesium,
      dietary_manganese: HKQuantityTypeIdentifierDietaryManganese,
      dietary_molybdenum: HKQuantityTypeIdentifierDietaryMolybdenum,
      dietary_niacin: HKQuantityTypeIdentifierDietaryNiacin,
      dietary_pantothenic_acid: HKQuantityTypeIdentifierDietaryPantothenicAcid,
      dietary_phosphorus: HKQuantityTypeIdentifierDietaryPhosphorus,
      dietary_potassium: HKQuantityTypeIdentifierDietaryPotassium,
      dietary_protein: HKQuantityTypeIdentifierDietaryProtein,
      dietary_riboflavin: HKQuantityTypeIdentifierDietaryRiboflavin,
      dietary_selenium: HKQuantityTypeIdentifierDietarySelenium,
      dietary_sodium: HKQuantityTypeIdentifierDietarySodium,
      dietary_sugar: HKQuantityTypeIdentifierDietarySugar,
      dietary_thiamin: HKQuantityTypeIdentifierDietaryThiamin,
      dietary_vitamin_a: HKQuantityTypeIdentifierDietaryVitaminA,
      dietary_vitamin_b12: HKQuantityTypeIdentifierDietaryVitaminB12,
      dietary_vitamin_b6: HKQuantityTypeIdentifierDietaryVitaminB6,
      dietary_vitamin_c: HKQuantityTypeIdentifierDietaryVitaminC,
      dietary_vitamin_d: HKQuantityTypeIdentifierDietaryVitaminD,
      dietary_vitamin_e: HKQuantityTypeIdentifierDietaryVitaminE,
      dietary_vitamin_k: HKQuantityTypeIdentifierDietaryVitaminK,
      dietary_zinc: HKQuantityTypeIdentifierDietaryZinc,
      sleep_analysis: HKCategoryTypeIdentifierSleepAnalysis,
      biological_sex: HKCharacteristicTypeIdentifierBiologicalSex,
      blood_type: HKCharacteristicTypeIdentifierBloodType,
      date_of_birth: HKCharacteristicTypeIdentifierDateOfBirth,
      blood_pressure: HKCorrelationTypeIdentifierBloodPressure,
      food: HKCorrelationTypeIdentifierFood,
      workout: HKWorkoutTypeIdentifier
    }

    def object_type(type)
      case type
      when :workout
        HKObjectType.workoutType
      when :sleep_analysis
        HKObjectType.categoryTypeForIdentifier type_identifier(type)
      when :biological_sex, :blood_type, :date_of_birth
        HKObjectType.characteristicTypeForIdentifier type_identifier(type)
      when :blood_pressure, :food
        HKObjectType.correlationTypeForIdentifier type_identifier(type)
      else
        HKObjectType.quantityTypeForIdentifier type_identifier(type)
      end
    end

    def type_identifier(type)
      type.is_a?(Symbol) ? TYPE_IDENTIFIERS[type] : type
    end

  end
end
