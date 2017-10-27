class User < ApplicationRecord

  validates :username, :password_digest, presence: true, uniqueness: true
  validates :session_token, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  after_initialize :ensure_session_token

  attr_reader :password

  has_many :cats,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Cat

  has_many :cat_rental_requests



  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(32)
    self.save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    pass_hash = BCrypt::Password.new(self.password_digest)
    pass_hash.is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    if user.is_password?(password)
      return user
    end

    return nil
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(32)
  end













end
