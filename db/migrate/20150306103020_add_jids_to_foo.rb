class AddJidsToFoo < ActiveRecord::Migration
  def change
    add_column :foos, :jids, :text
  end
end
