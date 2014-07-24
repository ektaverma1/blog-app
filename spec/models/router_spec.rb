require 'spec_helper'

describe Router do
  let(:calculator) {Calculator.new({:state=>0})}
  let(:router) { Router.new calculator }
  it 'give 5 if input is add 5' do
    expect(router.map Parser.new("add 5")).to eq(5)
  end
  it 'give -5 if input is subtract 5' do
    expect(router.map Parser.new("subtract 5")).to eq(-5)
  end

  it 'give 0 if input is multiply 5' do
    expect(router.map Parser.new("multiply 5")).to eq(0)
  end

  it 'give 0 if input is divide 5' do
    expect(router.map Parser.new("divide 5")).to eq(0)
  end

  it 'give reset the total to zero when cancel is given' do
    expect(router.map Parser.new("cancel")).to eq(0)
  end

  context "Function mapping" do

    it "should call + function of calcultor" do
      parser = Parser.new("add 5")
      expect(router.calculator).to receive(:+).with(5)
      router.map parser
    end
    it "should call - function of calcultor" do
      parser = Parser.new("subtract 5")
      expect(router.calculator).to receive(:-).with(5)
      router.map parser
    end
    it "should call * function of calcultor" do
      parser = Parser.new("multiply 5")
      expect(router.calculator).to receive(:*).with(5)
      router.map parser
    end
    it "should call / function of calcultor" do
      parser = Parser.new("divide 5")
      expect(router.calculator).to receive(:/).with(5)
      router.map parser
    end
  end

end