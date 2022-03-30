class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :username
      t.text :bio
      t.references :user, null: false, foreign_key: true
      t.string :avatar

      t.timestamps
    end
  end
end
