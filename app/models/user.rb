class User < ApplicationRecord
  # username: string
  # email: string
  # encrypted_password: string
  # reset_password_token: string
  # reset_password_sent_at: datetime
  # remember_created_at: datetime
  # confirmation_token: string
  # confirmed_at: datetime
  # confirmation_sent_at: datetime
  # unconfirmed_email: string
  # created_at: datetime
  # updated_at: datetime

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 15 },
            format: { without: /\s/, message: "must not contain any spaces" }

end
