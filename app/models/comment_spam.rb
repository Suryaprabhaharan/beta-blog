class CommentSpam < ApplicationRecord
	belongs_to :user
	belongs_to :comment
	after_create :check_reports
	after_commit :check_flag

	def check_reports
		if comment.comment_spams.count > 4 
			comment.destroy
		end
	end

	def check_flag
		if !comment.flagged?
			comment.update(flagged: true)
		end
	end
end