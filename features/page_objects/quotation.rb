module Quotation

	# Cotação
	class Step1 < SitePrism::Page

		element  :name, "#life_order_flow_lead_person_data_lead_person_attributes_name"
		element  :phone, "#life_order_flow_lead_person_data_lead_person_attributes_phone"
		element  :email, "#life_order_flow_lead_person_data_lead_person_attributes_email"
		element  :next_step, "input[name='commit']"

		def fill
			name.set $name
			phone.set "(99) 99999-9999"
			email.set $email
		end
	 
	end


	# Planos pra vc
	class Step2 < SitePrism::Page

		element  :date_of_birth, "#life_order_flow_pricing_requirements_insured_person_attributes_date_of_birth"
		element  :occupation, "#select2-life_order_flow_pricing_requirements_insured_person_attributes_occupation-container"
		element  :occupation_box, ".select2-search__field"
		element  :occupation_list, "#select2-life_order_flow_pricing_requirements_insured_person_attributes_occupation-results"
		element  :occupation_choice,  "li", text: "Outra profissão"
		element  :salary, "select[id=life_order_flow_pricing_requirements_insured_person_attributes_salary_range]"
		element  :marital_status, "select[id=life_order_flow_pricing_requirements_insured_person_attributes_has_mate]"
		element  :next_step, "input[name='commit']"

		def fill
			date_of_birth.set $date_of_birth
			occupation.click
			# sleep 2
			occupation_box.set "Outra profissão"
			# sleep 2
			occupation_choice.click
			# sleep 2
			salary.select("Até R$ 800,00")
			marital_status.select("Não quero informar")
		end
	 
	end


	# Coberturas/Assistências
	class Step3 < SitePrism::Page

		element  :make_my_own_plan, "input[value='Criar um plano do meu jeito']"
		element  :go_to_select_assistance, "input[type='submit']"
		element  :next_step, "input[name='commit']"

		def select_coverage(quantity)
			(0..quantity).each do |i|
				all('.switch')[i].select_option
			end
		end

		def select_assistance(quantity)
			(0..quantity).each do |i|
				all('.switch')[i].select_option
			end
		end

	end


	# Meus Dados
	class Step4 < SitePrism::Page

		element  :name, '#life_order_flow_insured_person_data_insured_person_attributes_name'
		element  :cpf, '#life_order_flow_insured_person_data_insured_person_attributes_cpf'
		element  :gender, 'select[id=life_order_flow_insured_person_data_insured_person_attributes_gender]'
		element  :zipcode, '#life_order_flow_insured_person_data_insured_person_attributes_address_attributes_zipcode'
		element  :number, '#life_order_flow_insured_person_data_insured_person_attributes_address_attributes_number'
		element  :compl, '#life_order_flow_insured_person_data_insured_person_attributes_address_attributes_complement'
		element  :next_step, "input[name='commit']"

		def fill
			name.set $name
			cpf.set $cpf
			gender.select "Masculino"
			zipcode.set "03102902"
			number.set Faker::Number.between(10, 50)
			compl.set "Apto #{Faker::Number.between(10, 100)}"
		end
	 
	end


	# Beneficiários
	class Step5 < SitePrism::Page

		element  :recipient, '#life_order_flow_beneficiaries_beneficiaries_attributes__name'
		element  :relationship, '#life_order_flow_beneficiaries_beneficiaries_attributes__relationship'
		element  :percentage, '#life_order_flow_beneficiaries_beneficiaries_attributes__compensation'
		element  :add_recipient,  "a", text: "ADICIONAR BENEFICIÁRIO"
		element  :next_step, "input[name='commit']"

		def fill
			recipient.set Faker::Name.name.tr(".", "")
			relationship.select "Mãe"
			percentage.set "10000"
		end
	 
	end


end