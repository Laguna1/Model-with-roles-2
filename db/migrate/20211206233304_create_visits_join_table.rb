# frozen_string_literal: true

class CreateVisitsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.datetime :date
      t.string :note
      t.references :pat, null: false, foreign_key: { to_table: :users }
      t.references :doc, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
