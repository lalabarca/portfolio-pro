class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.boolean :finished
      t.date :date_start
      t.date :date_end
      t.string :url

      t.timestamps
    end
  end
end
