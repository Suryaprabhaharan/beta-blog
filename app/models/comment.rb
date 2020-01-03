class Comment < ApplicationRecord
	belongs_to :article
	belongs_to :user, optional: true
	has_many :comment_spams, dependent: :destroy
	validates :description, presence: true
	after_create :check_star
	after_destroy :check_star

	def check_star
		article.comments.count > 4 ? article.update(star: true) : article.update(star: false)
	end

	def reported?(user)
     	comment_spams.where(user_id: user.id).count > 0
    end

    def addreport(user)
    	comment_spams << CommentSpam.new(user_id: user.id)
  	end
end