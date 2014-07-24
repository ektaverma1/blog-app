require 'rails_helper'

describe Calculator do 
	it "should return 5 on add 5" do
		calculator = Calculator.new({:state=>0})
		expect(calculator.+(5)).to eq(5)

	end

	it "should return -5 on subtract 5" do
		calculator = Calculator.new({:state=>0})
		expect(calculator.-(5)).to eq(-5)

	end
	it "should return 25 on multiply 5" do
		calculator = Calculator.new({:state=>5})
		expect(calculator.*(5)).to eq(25)

	end
	it "should return 5 on divide 25" do
		calculator = Calculator.new({:state=>25})
		expect(calculator./(5)).to eq(5)

	end
	it "should return 0 on cancel" do
		calculator = Calculator.new({:state=>0})
		expect(calculator.cancel).to eq(0)
	end
end
context "save" do
  it "saves upon add " do
    calculator =Calculator.new({:state=>0})
    calculator.+(5)
    expect(calculator.reload.state).to eq(5)
  end
end
