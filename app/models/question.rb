class Question < ApplicationRecord
  validates :q_text, presence: true
  validates :q_answer001, presence: true
  validates :q_answer001_active, presence: true
end
