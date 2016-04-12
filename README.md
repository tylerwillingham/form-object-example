Form Objects
============

1. `git checkout tags/v1.0`
2. `bundle install`
3. `bin/rake db:create; bin/rake db:migrate`


Details
-------

Models:

1. Company
  - Name
2. User
  - First name
  - Last name
  - Email
  - Username
  - Password

Controllers:

1. Registrations
  - new
  - create


Core idea
---------

Create a Registration form that creates a company and the company's first user.
Normally users do not require a last name or an email address but since we are
going to assume that our first user is our user who will handle billing, we
require it of them.

Also consider that a password + matching password confirmation is a concept that
is not core to our User domain model, this is also only relevant for our
registration form.


Instructions
------------

1. Look at our form in app/views/registrations/new
2. Implement the aforementioned presence requirement for a User's last name
   and their email address. Remember that this is not a domain requirement, but
   a requirement of the registration form based on our up front assumption.
3. Consider how this could be made simpler with a form object which mixes in
   ActiveModel::Model.
4. Consider testing a form object. Unit-level vs controller-level
5. Consider how a form object could pair with a service object
