# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :account
  belongs_to :community

  validates :title, presence: true
  validates :body, presence: true
  validates :account_id, presence: true
  validates :community_id, presence: true
end
