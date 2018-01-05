class CreateLastVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :last_visits do |t|
      t.integer :user_id
      t.string :path

      t.timestamps
    end
  end
end
