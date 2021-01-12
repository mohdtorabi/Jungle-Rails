class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }, presence: true
  validates :password, presence: true, length: { minimum: 3, maximum: 30 }
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
      if user && user.authenticate(password.strip)
      return user
      else
      return nil
    end
  end
end
