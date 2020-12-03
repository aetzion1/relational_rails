class CreateOrchestra < ActiveRecord::Migration[5.2]
  def change
    create_table :orchestras do |t|
      t.string :name
      t.datetime :year_established
    end
  end
end
