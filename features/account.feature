# language: pt

Funcionalidade: Criação de conta e login
	Como um futuro cliente da Youse
	Eu desejo realizar um cadastro
	E logar na minha conta


	Cenário: Criando minha conta
		Dado que eu acesse Minha Conta
		E escolha a opção de criar uma nova conta
		E preencha o cadastro
		Então minha conta será criada

	Cenário: Logando na minha conta
		Dado que eu acesse Minha Conta
		E preencha o formulário de login
		Então eu estarei logado
