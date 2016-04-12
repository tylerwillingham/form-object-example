class RegistrationForm
  include ActiveModel::Model

  attr_accessor :company_name,
                :first_name,
                :last_name,
                :email,
                :username,
                :password,
                :password_confirmation

  validates :company_name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validate :validate_password_and_confirmation_match

  def submit
    return false unless valid?

    company = Company.new(name: company_name)
    company.users.build(
      first_name: first_name,
      last_name: last_name,
      email: email,
      username: username,
      password: password
    )

    company.save!
  end

  def to_partial_path
    'registrations/form'
  end

  private

  def password_and_confirmation_match?
    password == password_confirmation
  end

  def validate_password_and_confirmation_match
    return if password_and_confirmation_match?

    errors.add(:password, 'and confirmation do not match')
  end
end
