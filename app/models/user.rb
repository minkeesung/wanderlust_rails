class User < ApplicationRecord
  has_many :trips
  has_many :hotels, through: :trips, foreign_key: "hotel_id"
  has_many :flights, through: :trips, source: :flights

  validates :name, presence: true
  validates :email, presence: true

    attr_reader :password

  def self.find_by_credentials(email, pw)
    user = User.find_by(email: email)
    user && user.is_password?(pw) ? user : nil
  end

  def reset_token
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

end
