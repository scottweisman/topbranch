class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :subdomain

      t.timestamps null: false
    end
    add_index :sites, :subdomain, unique: true
  end
end
