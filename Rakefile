# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/ios'
require './lib/medic'
require 'motion-stump'
require 'motion-redgreen'

begin
  require 'bundler'
  require 'motion/project/template/gem/gem_tasks'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.name = 'medic'
  app.seed_id = 'YC9LC2ATBH'
  app.identifier = 'com.ryanlntn.medic'

  app.entitlements['application-identifier'] = "#{app.seed_id}.#{app.identifier}"
  app.entitlements['com.apple.developer.healthkit'] = true

  app.frameworks += ['HealthKit']

  app.redgreen_style = :progress

  app.development do
    app.codesign_certificate = 'iPhone Developer: Ryan Linton (GZY2Z654JA)'
    app.provisioning_profile = 'signing/MedicDevelopment.mobileprovision'
  end

end
