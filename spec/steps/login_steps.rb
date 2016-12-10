module LoginSteps
  step 'Admin is logged in' do
    send 'I visit :path', '/admin/sign_in'
    send 'I fill form fields with:', Turnip::Table.new('Email' => 'soad.5@mail.ru', 'Password' => 'UZGE4nqP5buQ')
    send 'I click :button_name button', 'Log in'
    send 'I fill form fields with:', Turnip::Table.new('#authy-token' => '1234567')
    send 'I click :button_name button', 'Submit'
  end

  step 'I log in as investor with the biggest number of investments' do
    investor = Investor.includes(:investments).all.sort { |a, b| b.investments.size <=> a.investments.size }.first
    send 'I visit :path', '/investors/sign_in'
    send 'I fill form fields with:', Turnip::Table.new('Email' => investor.email, 'Password' => 'UZGE4nqP5buQ')
    send 'I click :button_name button', 'Investor Login'
    send 'I fill form fields with:', Turnip::Table.new('#authy-token' => '1234567')
    send 'I click :button_name button', 'Submit'
  end
end

RSpec.configure { |c| c.include LoginSteps }
