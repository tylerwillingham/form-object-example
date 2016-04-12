require 'test_helper'

class RegistrationFormTest < ActiveSupport::TestCase
  it 'will not submit if invalid' do
    form = RegistrationForm.new

    submission = form.submit

    refute submission
  end

  it 'requires the password and confirmation to match' do
    submission = RegistrationForm.new(
      password: '12345',
      password_confirmation: '54321'
    )

    submission.valid?

    assert submission.errors.key? :password
    assert submission.errors[:password].include? 'and confirmation do not match'
  end
end
