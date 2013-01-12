When /^I visit the homepage$/ do
  visit '/'
end

When /^I login with username "(.*?)" and password "(.*?)"$/ do |user, password|
  page.driver.browser.basic_authorize(user, password)
  visit '/'
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end
