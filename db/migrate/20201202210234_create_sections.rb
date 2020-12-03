class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.timestamp :created_date
      t.boolean :section_full
    end
  end
end
