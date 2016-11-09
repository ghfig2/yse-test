Dado(/^que eu acesse Minha Conta$/) do
	@account = Account.new
	@account.load
	@account.my_account.click
end

Dado(/^escolha a opção de criar uma nova conta$/) do
	@account.new_account.click
end

Dado(/^preencha o cadastro$/) do
  @account.signup
end

Então(/^minha conta será criada$/) do
	@account.am_I_logged_in?
end

Dado(/^preencha o formulário de login$/) do
  @account.login
end

Então(/^eu estarei logado$/) do
	@account.am_I_logged_in?
end