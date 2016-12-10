module DataSteps
  step 'A sample database' do
    FactoryGirl.create(:admin)
    FactoryGirl.create(:investor)
  end

  step 'A production database' do
    Dir.chdir(Rails.root.to_s)
    %x(  pg_restore --clean --no-acl --no-owner -d dragonfly_irs_test tmp/database_backups/carep.dump )
  end

  step "All investors' password changed" do
    encrypted_password = Investor.new(password: 'UZGE4nqP5buQ').encrypted_password
    Investor.update_all(encrypted_password: encrypted_password)
    Admin.update_all(encrypted_password: encrypted_password)
  end
end

RSpec.configure { |c| c.include DataSteps }
