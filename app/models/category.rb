# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :users
  validates :speciality, uniqueness: true

  def choose_category1
    collection_select(
      :user, :category_id, Category.all, :id, :speciality, { prompt: true }
    ).gets.chomp.to_i
  end

  def choose_doctor_category1
    User.where category_id: gets.chomp.to_i
  end

  def choose_category
    cat_doc = collection_select(
      :user, :category_id, Category.all, :id, :speciality, { prompt: true }
    ).gets.chomp.to_i
  end

  # def choose_doctor_category
  #   users = User.where category_id: gets.chomp.to_i
  #   users.each do |user|
  #     user.fullname
  #   end
  # end

  def choose_doctor_from_category
    User.where category_id gets.chomp.to_i
    category(category_id).users.each(&:fullname)
  end
end
