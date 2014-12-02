module Medic
  module HKConstants

    ERROR_CODES = {
      no_error: HKNoError,
      health_data_unavailable: HKErrorHealthDataUnavailable,
      health_data_restricted: HKErrorHealthDataRestricted,
      invalid_argument: HKErrorInvalidArgument,
      authorization_denied: HKErrorAuthorizationDenied,
      authorization_not_determined: HKErrorAuthorizationNotDetermined,
      database_inaccessible: HKErrorDatabaseInaccessible,
      user_canceled: HKErrorUserCanceled
    }

    UPDATE_FREQUENCIES = {
      immediate: HKUpdateFrequencyImmediate,
      hourly: HKUpdateFrequencyHourly,
      daily: HKUpdateFrequencyDaily,
      weekly: HKUpdateFrequencyWeekly
    }

    AUTHORIZATION_STATUSES = {
      not_determined: HKAuthorizationStatusNotDetermined,
      sharing_denied: HKAuthorizationStatusSharingDenied,
      sharing_authorized: HKAuthorizationStatusSharingAuthorized
    }

    BIOLOGICAL_SEXES = {
      not_set: HKBiologicalSexNotSet,
      female: HKBiologicalSexFemale,
      male: HKBiologicalSexMale
    }

    BLOOD_TYPES = {
      not_set: HKBloodTypeNotSet,
      a_positive: HKBloodTypeAPositive,
      a_negative: HKBloodTypeANegative,
      b_positive: HKBloodTypeBPositive,
      b_negative: HKBloodTypeBNegative,
      a_b_positive: HKBloodTypeABPositive,
      a_b_negative: HKBloodTypeABNegative,
      o_positive: HKBloodTypeOPositive,
      o_negative: HKBloodTypeONegative
    }

    SLEEP_ANALYSES = {
      in_bed: HKCategoryValueSleepAnalysisInBed,
      asleep: HKCategoryValueSleepAnalysisAsleep
    }

    def error_code(error)
      error.is_a?(Symbol) ? ERROR_CODES[error] : error
    end

    def update_frequency(freq)
      freq.is_a?(Symbol) ? UPDATE_FREQUENCIES[freq] : freq
    end

    def authorization_status(auth_status)
      auth_status.is_a?(Symbol) ? AUTHORIZATION_STATUSES[auth_status] : auth_status
    end

    def biological_sex(sex)
      sex.is_a?(Symbol) ? BIOLOGICAL_SEXES[sex] : sex
    end

    def blood_type(blood)
      blood.is_a?(Symbol) ? BLOOD_TYPES[blood] : blood
    end

    def sleep_analysis(sleep)
      sleep.is_a?(Symbol) ? SLEEP_ANALYSES[sleep] : sleep
    end

  end
end
