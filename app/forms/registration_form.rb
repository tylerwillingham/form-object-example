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
  validates :username, presence: true
  validates :password, presence: true

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
end
