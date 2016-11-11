Dado(/^que escolha visitar a página do "([^"]*)"$/) do |insurance|
	@product = Product.new(insurance)
	@product.load
	@product.go_to
end

Quando(/^eu estiver na página desse seguro$/) do
	@product.check_url
	@product.check_title
end

Então(/^eu devo ver informações desse produto$/) do
	@product.check_content
end