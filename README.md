# Medic [![Gem Version](https://badge.fury.io/rb/medic.svg)](http://badge.fury.io/rb/medic) [![Code Climate](https://codeclimate.com/github/ryanlntn/medic/badges/gpa.svg)](https://codeclimate.com/github/ryanlntn/medic) [![Dependency Status](https://gemnasium.com/ryanlntn/medic.svg)](https://gemnasium.com/ryanlntn/medic)

Is HealthKit's verbose and convoluted API driving you to autolobotomization? Quick! You need a medic!

## Installation

1. Add this line to your application's Gemfile:

  ```ruby
  gem 'medic'
  ```

1. Add the following lines to your Rakefile:

  ```ruby
  app.entitlements['com.apple.developer.healthkit'] = true
  app.frameworks += ['HealthKit']
  ```

1. Run `bundle` and `rake`.

## Usage

### Authorization

To request authorization to read or share (i.e. write) a data type implement the following in `viewDidAppear` of your `UIViewController`:

```ruby
if Medic.available?
  types = { share: :step_count, read: [:step_count, :date_of_birth] }

  Medic.authorize types do |success, error|
    NSLog "Success!" if success
  end
end
```

This will open the permissions modal. `success` will be `false` if the user canceled the prompt without selecting permissions; `true` otherwise.

You can subsequently check if you're authorized to share a data type:

```ruby
Medic.authorized?(:step_count)
```

Note: For privacy reasons Apple does not allow you to check if you're authorized to read data types.

### Sharing Samples

Coming soon...

### Reading Data

HealthKit provides a number of methods for accessing its data, mostly in the form of query objects with verbose initializers that return more `HKObject`s with repetitive method names. For example, if I wanted to get the total number of steps taken per day for the last week I could use a `HKStatisticsCollectionQuery` like so:

```ruby
@store = HKHealthStore.new

today = NSDate.date
one_week_ago = NSCalendar.currentCalendar.dateByAddingComponents(NSDateComponents.new.setDay(-7), toDate: today, options: 0)

query = HKStatisticsCollectionQuery.initWithQuantityType(
          HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount),
          quantitySamplePredicate: nil,
          options: HKStatisticsOptionCumulativeSum,
          anchorDate: one_week_ago,
          intervalComponents: (NSDateComponents.new.day = 1)
        )

query.initialResultsHandler = ->(query, results, error){
  results.enumerateStatisticsFromDate(one_week_ago, toDate: today, withBlock: ->(result, stop){
    if quantity = result.sumQuantity
      NSLog quantity.doubleValueForUnit(HKUnit.countUnit).to_s
    else
      NSLog "no quantity"
    end
  })
}

@store.executeQuery(query)
```

This doesn't make for the most readable code. As a Ruby developer you might find this downright distasteful. Let's check out the Medic equivalent:

```ruby
one_week_ago = NSCalendar.currentCalendar.dateByAddingComponents(NSDateComponents.new.setDay(-7), toDate: today, options: 0)

options = { options: :sum, anchor: one_week_ago, interval: :day}

Medic.find_statistics_collection :step_count, options do |statistics|
  statistics.each do |stats|
    NSLog stats[:sum].to_s
  end
end
```

Now that's more like it! Instead of constructing `HKObjectType` by hand we can now just pass in a symbol. We also don't have to work directly with `HKStatisticsCollection` anymore. The result is parsed into an array of hashes with reasonable values for us.

#### Finders

Medic provides a finder for each class of `HKQuery`:

##### find_anchored

Provide an easy way to search for new data in the HealthKit store.

```ruby
@anchor = nil

Medic.find_anchored :step_count, anchor: @anchor do |results, new_anchor|
  @anchor = new_anchor
  results.each do |sample|
    NSLog sample.to_s
  end
end
```

##### find_correlation

Search for correlations in the HealthKit store.

```ruby
high_cal = HKQuantity.quantityWithUnit(HKUnit.kilocalorieUnit, doubleValue: 800.0)
greater_than_high_cal = HKQuery.predicateForQuantitySamplesWithOperatorType(NSGreaterThanOrEqualToPredicateOperatorType, quantity: high_cal)

sample_predicates = { dietary_energy_consumed: greater_than_high_cal }

Medic.find_correlations :food, sample_predicates: sample_predicates do |correlations|
  correlations.each do |correlation|
    NSLog correlation.to_s
  end
end
```

##### observe

Set up a long-running task on a background queue.

```ruby
Medic.observe :step_count do |completion, error|
  Medic.find_sources :step_count do |sources|
    sources.each do |source|
      NSLog source
    end
  end
end
```

##### find_samples

Search for sample data in the HealthKit store.

```ruby
Medic.find_samples :blood_pressure, sort: :start_date, limit: 7 do |samples|
  samples.each do |sample|
    NSLog sample.to_s
  end
end
```

##### find_sources

Search for the sources (apps and devices) that have saved data to the HealthKit store.

```ruby
Medic.find_sources :step_count do |sources|
  sources.each do |source|
    NSLog source
  end
end
```

##### find_statistics

Perform statistical calculations over the set of matching quantity samples.

```ruby
Medic.find_statistics :step_count, options: :sum do |statistics|
  NSLog statistics.to_s
end
```

##### find_statistics_collection

Perform multiple statistics queries over a series of fixed-length time intervals.

```ruby
one_week_ago = NSCalendar.currentCalendar.dateByAddingComponents(NSDateComponents.new.setDay(-7), toDate: today, options: 0)

options = { options: :sum, anchor: one_week_ago, interval: :day}

Medic.find_statistics_collection :step_count, options do |statistics|
  statistics.each do |stats|
    NSLog stats[:sum].to_s
  end
end
```

#### Characteristic Data

Characteristic data like biological sex or blood type have their own methods:

```ruby
Medic.biological_sex # => :male
Medic.date_of_birth  # => 1987-11-07 00:00:00 -0800
Medic.blood_type     # => :o_negative
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
