require 'rails_helper'
describe CalculatorController do
  it "response to be 200 on put call" do
	put :update, :command => "add 5"
	expect(response.status).to eq(200)
	expect(assigns[:state]).to eq(5.0)
  end
end