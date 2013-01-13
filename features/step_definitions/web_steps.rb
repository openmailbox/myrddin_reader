When /^I login with username "(.*?)" and password "(.*?)"$/ do |user, password|
  page.driver.browser.basic_authorize(user, password)
end

Given /^I am logged in$/ do
  step 'I login with username "test" and password "testing"'
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

When /^I visit "(.*?)"$/ do |path|
  visit path
end

When /^I click on "(.*?)"$/ do |target|
  click_on target
end

Then /^I should see a link to "(.*?)"$/ do |link|
  page.should have_link('link')
end

