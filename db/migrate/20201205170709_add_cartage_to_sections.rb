class AddCartageToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :cartage, :boolean
  end
end
