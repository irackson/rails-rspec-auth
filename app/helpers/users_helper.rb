module UsersHelper
  def mock_user
    test_pw = 'password'
    current_user = User.first_or_create!(email: 'bluestreak@math.com', password: test_pw, password_confirmation: test_pw)
  end
end
