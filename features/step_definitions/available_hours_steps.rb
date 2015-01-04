Given(/^my I was hired on (.*)$/) do |hired_on|
  profile = Profile.new(hired_on: DateTime.parse(hired_on))
  @employee = User.new(profile: profile)
end

Given(/^today is (.*)$/) do |current_date|
  current_date = DateTime.parse(current_date)
  Timecop.freeze(current_date)
end

When(/^I inquire about my available pto hours$/) do
  @available_hours = PtoCalculator.instance(@employee).available_hours
end

Then(/^my available pto hours should be (.*)$/) do |expected_available_pto_hours|
  expect(format("%.2f", @available_hours)).to eq expected_available_pto_hours
end