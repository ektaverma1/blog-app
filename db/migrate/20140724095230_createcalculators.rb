class Createcalculators < ActiveRecord::Migration
  def change
  	create_table :calculators do |t|
      t.float :state
      t.timestamps
  end
end
end