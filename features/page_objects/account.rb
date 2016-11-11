class Account < SitePrism::Page

include RSpec::Matchers

	set_url "/"
	element  :my_account,  "a", text: "MINHA CONTA"
	element  :new_account, "a", text: "CADASTRE-SE"

	element  :signup_form_name, "#user_name"
	element  :signup_form_email, "#user_email"
	element  :signup_form_password, "#user_password"
	element  :signup_form_password_confirmation, "#user_password_confirmation"
	element  :signup_form_submit, "input[name='commit']"

	element  :login_form_email, "#email"
	element  :login_form_next_step, "input[name='commit']"
	element  :login_form_password, "#user_password"
	element  :login_form_submit, "input[name='commit']"

	def signup
		signup_form_name.set $name
		signup_form_email.set $email
		signup_form_password.set $password
		signup_form_password_confirmation.set $password
		signup_form_submit.click
	end

	def login (email = $email, password = $password)
		login_form_email.set email
		login_form_next_step.click
		login_form_password.set password
		login_form_submit.click
	end

	def am_I_logged_in?
		expect(page).to have_content "Olá, #{$name}"
	end

end
