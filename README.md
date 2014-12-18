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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
