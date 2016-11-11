class Product < SitePrism::Page

include Capybara::DSL
include RSpec::Matchers

	attr_accessor :name, :tag, :path
	set_url "/"
	element  :content_box_title, "h1.title"
	element  :content_about, "#sobre-o-segguro"
	element  :content_services, "#servicos"
	element  :content_questions, "#duvidas"
 

	def initialize(product)
		@name = product
		@tag  = (product.downcase).tr(" ", "-")
		@path = "/#{tag}"
	end

	def go_to
		click_link("#{@name}", match: :first)
	end

	def check_url
		expect(page).to have_current_path(@path)
	end

	def check_title
		expect(page.title).to include @name
	end

	def check_content
		expect(content_box_title.text).to eq @name
		expect(self).to have_content_about
		expect(self).to have_content_services
		expect(self).to have_content_questions
	end

end
