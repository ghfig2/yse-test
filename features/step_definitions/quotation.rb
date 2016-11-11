Dado(/^que eu esteja lendo sobre o "([^"]*)"$/) do |insurance|
	@product = Product.new(insurance)
	@product.load
	@product.go_to
end

Dado(/^decida fazer uma cotação online$/) do
	@product.quotation.click
end

Então(/^vou preencher a tela "([^"]*)" de "([^"]*)"$/) do |step_number, step_name|

	case step_number

	when "1"
		@step1 = Quotation::Step1.new
		@step1.fill
		@step1.next_step.click
	when "2"
		@step2 = Quotation::Step2.new
		@step2.fill
		@step2.next_step.click
	when "3"
		@step3 = Quotation::Step3.new
		@step3.make_my_own_plan.click
		@step3.select_coverage(2)
		@step3.go_to_select_assistance.click
		@step3.select_assistance(3)
		@step3.next_step.click
	when "4"
		@step4 = Quotation::Step4.new
		@step4.fill
		@step3.next_step.click
	when "5"
		@step5 = Quotation::Step5.new
		@step5.fill
		@step5.next_step.click
	end

end

Então(/^vou ver a tela de pagamento$/) do
	expect(page).to have_content "Para finalizar, insira os dados de pagamento."
end