# frozen_string_literal: true

class CreateVizits < ActiveRecord::Migration[6.1]
  def change
    create_table :vizits do |t|
      t.datetime :date
      t.string :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
