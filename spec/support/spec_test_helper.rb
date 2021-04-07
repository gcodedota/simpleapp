module SpecTestHelper
  def login(user)
    session[:user] = user.id
  end

  def current_user
    Employee.find(session[:user])
  end
end