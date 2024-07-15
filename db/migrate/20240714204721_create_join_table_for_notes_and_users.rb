class CreateJoinTableForNotesAndUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :shared_notes do |t|
      t.references :note, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :shared_notes, [:note_id, :user_id], unique: true
  end
end
