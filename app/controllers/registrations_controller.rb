class RegistrationsController < ApplicationController
  def new
    @company  ||= Company.new.tap do |company|
                    company.users.new
                  end
  end

  def create
    company = Company.new company_params

    if company.save
      redirect_to(
        new_registration_path,
        flash: { notice: 'Registered successfully!' }
      )
    else
      render :new, flash: { error: 'Registration failed' }
    end
  end

  private

  def company_params
    params
      .require(:company)
      .permit(
        :name,
        users_attributes: [
          :first_name,
          :last_name,
          :email,
          :username,
          :password,
          :password_confirmation
        ]
      )
  end
end
