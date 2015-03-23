class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.string :title
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
