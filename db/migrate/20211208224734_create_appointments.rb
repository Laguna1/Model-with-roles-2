# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :date_opening
      t.string :recomendation
      t.boolean :status, default: false

      t.references :pat, null: false, foreign_key: { to_table: :users }
      t.references :doc, null: false, foreign_key: { to_table: :users }
      t.references :visit, null: false, foreign_key: true
      t.timestamps
    end
  end
end
