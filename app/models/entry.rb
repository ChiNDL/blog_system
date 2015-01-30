class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :body, presence: true
  validates :title, presence: true
end
