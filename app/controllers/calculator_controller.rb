class CalculatorController < ApplicationController
	def update
		command=params[:command]
		parser = Parser.new(command)
		calc = Calculator.last || Calculator.create(:state => 0)
		router = Router.new(calc)
		result=router.map(parser)
     	@state = calc.state
     	# render "index"
	end
end
