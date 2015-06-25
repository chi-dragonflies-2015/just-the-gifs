class User < ActiveRecord::Base

  validates :user_name, presence: true
  validates :email, presence: true
  validates :email, format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/, message: "only valid emails" }

  validate :password_format

  #validates :password, confirmation: true
  #validates :confirm_password, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end



  def password=(new_password)
    self.plaintext_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(user_name, received_password)
    user = User.find_by(user_name: username)
    user.password == received_password && !user.nil? ? user : nil
  end

  private
  attr_accessor :plaintext_password
  def password_format
    if plaintext_password.nil? || plaintext_password.length < 6
      errors.add(:password, "must be greater than 5 characters")
    end
  end
end
