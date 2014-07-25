require 'rails_helper'
describe Api::CalculatorController do
  it "response to be 200 on post call" do
  	post :create
  	expect(response.status).to eq(200)
  end

  it "response to be 201 on put on update" do 
 	Calculator.create(state: 0)
  	put :update ,:command => "add 5"
  	expect(response.status).to eq(200)
  	expect(response.body).to eq({ :state => 5.0}.to_json)
  end

   it "response to be 404 on put on update if no calculator exixts" do 
  	put :update ,:command => "add 5"
  	expect(response.status).to eq(404)
  end
end