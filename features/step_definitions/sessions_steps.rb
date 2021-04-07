Given('a employee') do
  @employee = create(:employee)
end

When('Login to the system') do
  post "/login?email=#{@employee.email}&password=#{@employee.password}"
end

Then('I should successfully login') do
  expect(last_response.body).to include('<html><body>You are being <')
end

Given('no employees created') do
end

When('Login to the system with wrong password and email') do
  post '/login?email=randomEmail@email.com&password=randomPassword'
end


Then('I should fail') do
  expect(last_response.body).to include('Email: <input type="text" name="email" id="email" />')
  expect(last_response.body).to include('Password: <input type="password" name="password" id="password" />')
end
