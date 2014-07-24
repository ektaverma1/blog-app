require 'rails_helper'

describe Parser do 
	it "should split the input " do
		parser = Parser.new("add 5")
		expect(parser.parse).to eq(['add','5'])
	end
end