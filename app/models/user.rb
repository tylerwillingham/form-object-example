class User < ActiveRecord::Base
  belongs_to :company

  validates :company_id, presence: true
  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  def name
    return first_name unless last_name

    [first_name, last_name].join(' ')
  end
end
