class AddSpecialtyToSkills < ActiveRecord::Migration[6.1]
  def change
    add_column :skills, :specialty, :string
  end
end
