class Article < ApplicationRecord
	belongs_to :user
	has_many :article_categories
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
	has_many :categories, through: :article_categories
	validates :title, presence: true, length: {minimum: 3, maximum: 30}
	validates :description, presence: true, length: {minimum: 10, maximum: 1000}
	validates :user_id, presence: true

	 def addlike(user)
    	likes << Like.new(user_id: user.id, status: true)
  	end

  	def adddislike(user)
    	likes << Like.new(user_id: user.id, status: false)
  	end

  	def becomeneutral(user)
  		likes.where(user_id: user.id).first.destroy
    end

    def toggle_like(user)
      if likes?(user)
        likes.where(user_id: user.id).first.update(status: false)
      elsif dislikes?(user)
        likes.where(user_id: user.id).first.update(status: true)
      end
    end

    def num_likes
      likes.positive.count
    end

    def num_dislikes
      likes.negative.count
    end

    def likes?(user)
      likes.user_likes(user).count > 0
    end

    def dislikes?(user)
      likes.user_dislikes(user).count > 0
    end
end