class CreateDojos < ActiveRecord::Migration
  def change
    create_table :dojos do |t|
      t.string :branch
      t.string :street
      t.string :city
      t.string :satate

      t.timestamps null: false
    end
  end
end
