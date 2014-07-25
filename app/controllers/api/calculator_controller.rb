module Api
	class CalculatorController < ApplicationController 
		
		def update
		  calculator=Calculator.first
		  if calculator
			command=params[:command]
			parser = Parser.new(command)
			router = Router.new(calculator)
			result=router.map(parser)
	        render :json=> {:state => calculator.state }
	      else
	    	head :not_found
	      end
		end

	
	    def create
	    	calculator = Calculator.first || Calculator.create({:state => 0})
	    	head :created
	    end
	end
end