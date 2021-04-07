When('I visit login page') do
  visit "/login"
end

Then('I fill {string} with {string}') do |string, string2|
  fill_in(string, with: string2)
end

Then('I press {string}') do |string|
  click_button(string)
end

Then('I should see content') do
  expect(page.current_path).to eql("/employees/#{@employee.id}")
  expect(page).to have_content("email@email.com")
end

