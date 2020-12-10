class RemoveSectionFullFromSections < ActiveRecord::Migration[5.2]
  def change
    remove_column :sections, :section_full, :boolean
  end
end
