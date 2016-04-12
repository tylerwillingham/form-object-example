class User < ActiveRecord::Base
  attr_reader :password

  belongs_to :company

  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  def name
    return first_name unless last_name

    [first_name, last_name].join(' ')
  end

  def password=(value)
    @password = value
    self.encrypted_password = 'this-is-so-encrypted'
  end
end
