# frozen_string_literal: true

class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mobile_no, :string
    add_column :users, :address, :string
  end
end
