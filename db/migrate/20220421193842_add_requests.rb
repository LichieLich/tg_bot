class AddRequests < ActiveRecord::Migration[6.0]
  def change
    create_table(:requests) do |t|
      t.string :value, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
