# frozen_string_literal: true

class Community < ApplicationRecord
  belongs_to :account
  has_many :posts

  validates :url, presence: true
  validates :name, presence: true
  validates :rules, presence: true
end
