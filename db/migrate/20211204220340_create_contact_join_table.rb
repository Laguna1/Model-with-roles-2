class CreateContactJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :contact do |t|
      t.integer :patient_id, :null => false
      t.integer :doctor_id, :null => false

      t.timestamps
    end

    add_index :contact, :patient_id
    add_index :contact, :doctor_id
    add_index :contact, [:patient_id, :doctor_id], unique: true
  end
end
