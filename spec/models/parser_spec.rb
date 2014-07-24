require 'spec_helper'

describe Parser do
  context "Equality checks" do
    let(:parser) do
      parser=Parser.new("add 5")
    end
    it "should be equal for same object id" do
      expect(parser).to eq(parser)
    end

    it "should not be null" do
      expect(parser).to_not eq(nil)
    end

    it "should not be equal for different type" do
      object = Object.new
      expect(parser).to_not eq(object)
    end

    it "should have same hash code" do
      parser1 = Parser.new("add 5")
      parser2 = Parser.new("add 5")
      expect(parser1.hash).to eq(parser2.hash)
    end

    it "symmetric property" do
      parser1 = Parser.new("add 5")
      parser2 = Parser.new("add 5")
      expect(parser1).to eq(parser2) and expect(parser2).to eq(parser1)
    end

    it "transitive property" do
      parser1 = Parser.new("add 5")
      parser2 = Parser.new("add 5")
      parser3 = Parser.new("add 5")
      expect(parser1).to eq(parser2) and expect(parser2).to eq(parser3) and expect(parser3).to eq(parser1)
    end
  end
end