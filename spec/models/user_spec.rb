require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user validation' do
    it 'should be valid user' do 
      @user = User.new(name: "Steph", password:'2011', password_confirmation:'2011', email: "b@b.com")
      expect(@user).to be_valid
    end
    it 'should be invalid password match' do 
      @user = User.new(name: "Steph", password:'2011', password_confirmation:"12121212121", email: "b@b.com")
      expect(@user).to be_invalid
    end
    it 'validates fails for password length less than min' do 
      @user = User.new(name: "Steph", password:'20', password_confirmation:'20', email: "b@b.com")
      expect(@user).to be_invalid
    end
    it 'validates fails for password length more than max' do 
      @user = User.new(name: "Steph", password:'2046128645182654861534615460125480364513538746186546185168', password_confirmation:'22320',   email: "b@b.com")
      expect(@user).to be_invalid
    end
    it 'validates to have a name' do 
      @user = User.new(name: "Steph", password:'2028472809', password_confirmation:'2028472809', email: "b@b.com")
      expect(@user).to be_valid
    end
    it 'validates email uniqueness' do 
      @user = User.new(name: "Steph", password:'2028472809', password_confirmation:'2028472809', email: "b@b.com")
      @user.save!
      @user1 = User.new(name: "Steph", password:'2028472809', password_confirmation:'2028472809', email: "B@b.com")
      expect(@user1).to be_invalid
    end
  end
  describe '.authenticate_with_credentials' do
    it 'authinticate user with credentials' do 
      @user = User.new(name: "Steph", password:'2028472809', password_confirmation:'2028472809', email: "b@b.com")
      @user.save!
      
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
    end
    it 'authinticate password with credentials' do 
      @user = User.new(name: "Steph", password:'2028472809', password_confirmation:'2028472809', email: "b@b.com")
      @user.save!
      expect(@user.authenticate_with_credentials(@user.email, "")).to_not eq(@user)
    end
    it 'Not authinticate email with credentials' do 
      @user = User.new(name: "Steph", password:'2028472809', password_confirmation:'2028472809', email: "b@b.com")
      @user.save!
      expect(@user.authenticate_with_credentials("", @user.password)).to_not eq(@user)
    end
    it 'Not authinticate email with whitespace' do 
      @user = User.new(name: "Steph", password:'2028472809', password_confirmation:'2028472809', email: "b@b.com")
      @user.save!
      expect(@user.authenticate_with_credentials("   b@b.com  ", @user.password)).to eq(@user)
    end
    it 'Not authinticate password with whitespace' do 
      @user = User.new(name: "Steph", password:'2028472809', password_confirmation:'2028472809', email: "b@b.com")
      @user.save!
      expect(@user.authenticate_with_credentials(@user.email, "   2028472809   ")).to eq(@user)
    end
    it 'Not authinticate email with cap and lock' do 
      @user = User.new(name: "Steph", password:'2028472809', password_confirmation:'2028472809', email: "b@b.com")
      @user.save!
      expect(@user.authenticate_with_credentials("   B@B.com  ", @user.password)).to eq(@user)
    end
  end
  
end
