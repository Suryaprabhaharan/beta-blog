class Like < ApplicationRecord
	belongs_to :article
	belongs_to :user
	scope :positive, -> { where(status: true) }
	scope :negative, -> { where(status: false) }
	scope :user_likes, -> (user) {where(user_id: user.id, status: true)}
	scope :user_dislikes, -> (user) {where(user_id: user.id, status: false)}
end