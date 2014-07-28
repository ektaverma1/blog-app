module Api
	class CalculatorController < ApplicationController 
	protect_from_forgery	
	before_action :set_headers
		def update
		  calculator=Calculator.first
		  if calculator
			command=params[:command]
			parser = Parser.new(command)
			router = Router.new(calculator)
			result=router.map(parser)

	        render :json=> {:state => Calculator.last.state }
	      else
	    	head :not_found
	      end
		end

	
	    def create
	    	calculator = Calculator.first || Calculator.create({:state => 0})
	    	head :created
	    end
	    # THIS
		def set_headers
			headers['Access-Control-Allow-Origin'] = '*'
			headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
			headers['Access-Control-Request-Method'] = '*'
			headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
		end
	end
end