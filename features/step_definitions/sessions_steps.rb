Given('a employee') do
  @employee = create(:employee)
end

When('Login to the system') do
  post "/login", :email => @employee.email, :password => "12345"
end

Then('I should successfully login') do
  expect(last_response.body).to include("<html><body>You are being <a href=\"http://example.org/employees/#{@employee.id}\">redirected</a>.</body></html>")
end

Given('no employees created') do
end

When('Login to the system with wrong password and email') do
  post "/login", :email => "random email", :password => "12345"
end


Then('I should fail') do
  expect(last_response.body).to include('Email: <input type="text" name="email" id="email" />')
  expect(last_response.body).to include('Password: <input type="password" name="password" id="password" />')
end
