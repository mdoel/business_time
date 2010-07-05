# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{business_time}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["bokmann"]
  s.date = %q{2010-06-20}
  s.description = %q{Have you ever wanted to do things like "6.business_days.from_now" and have weekends and holidays taken into account?  Now you can.}
  s.email = %q{dbock@codesherpas.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "business_time.gemspec",
     "lib/business_time.rb",
     "lib/business_time/business_days.rb",
     "lib/business_time/business_hours.rb",
     "lib/business_time/business_minutes.rb",
     "lib/business_time/config.rb",
     "lib/extensions/date.rb",
     "lib/extensions/fixnum.rb",
     "lib/extensions/float.rb",
     "lib/extensions/hash.rb",
     "lib/extensions/string.rb",
     "lib/extensions/time.rb",
     "lib/generators/business_time/config_generator.rb",
     "rails_generators/business_time_config/business_time_config_generator.rb",
     "rails_generators/business_time_config/templates/business_time.rb",
     "rails_generators/business_time_config/templates/business_time.yml",
     "spec/business_minutes_spec.rb",
     "spec/config_spec.rb",
     "spec/date_ext_spec.rb",
     "spec/fixnum_ext_spec.rb",
     "spec/float_ext_spec.rb",
     "spec/hash_ext_spec.rb",
     "spec/spec_helper.rb",
     "spec/string_ext_spec.rb",
     "spec/time_ext_spec.rb",
     "test/helper.rb",
     "test/test_business_days.rb",
     "test/test_business_days_eastern.rb",
     "test/test_business_days_utc.rb",
     "test/test_business_hours.rb",
     "test/test_business_hours_eastern.rb",
     "test/test_business_hours_utc.rb",
     "test/test_config.rb"
  ]
  s.homepage = %q{http://github.com/bokmann/business_time}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Support for doing time math in business hours and days}
  s.test_files = [
    "spec/business_minutes_spec.rb",
     "spec/config_spec.rb",
     "spec/date_ext_spec.rb",
     "spec/fixnum_ext_spec.rb",
     "spec/float_ext_spec.rb",
     "spec/hash_ext_spec.rb",
     "spec/spec_helper.rb",
     "spec/string_ext_spec.rb",
     "spec/time_ext_spec.rb",
     "test/helper.rb",
     "test/test_business_days.rb",
     "test/test_business_days_eastern.rb",
     "test/test_business_days_utc.rb",
     "test/test_business_hours.rb",
     "test/test_business_hours_eastern.rb",
     "test/test_business_hours_utc.rb",
     "test/test_config.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0.0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 2.0.0"])
  end
end

