class RegistrationsController < ApplicationController
  def new
    @registration = RegistrationForm.new
  end

  def create
    @registration = RegistrationForm.new registration_params

    if @registration.submit
      redirect_to(
        new_registration_path,
        flash: { notice: 'Registered successfully!' }
      )
    else
      render :new, flash: { error: 'There was a problem saving your information' }
    end
  end

  private

  def registration_params
    params
      .require(:registration)
      .permit(
        :company_name,
        :first_name,
        :last_name,
        :email,
        :username,
        :password,
        :password_confirmation
      )
  end
end
