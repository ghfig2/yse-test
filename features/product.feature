# language: pt

Funcionalidade: Navegação pelos produtos oferecidos pela Youse
	Como um possível cliente da Youse
	Eu desejo navegar pela página de cada produto
	E conhecer mais sobre eles


	Cenário: Navegando pelo seguro para casas
		Dado que escolha visitar a página do "Seguro Residencial"
		Quando eu estiver na página desse seguro
		Então eu devo ver informações desse produto

	Cenário: Navegando pelo seguro para carros
		Dado que escolha visitar a página do "Seguro Auto"
		Quando eu estiver na página desse seguro
		Então eu devo ver informações desse produto

	Cenário: Navegando pelo seguro de vida
		Dado que escolha visitar a página do "Seguro Vida"
		Quando eu estiver na página desse seguro
		Então eu devo ver informações desse produto