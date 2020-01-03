class CommentsController < ApplicationController
	before_action :set_comment, except: [:create]
	before_action :set_article, except: [:create]
	
	def edit
		if logged_in? && current_user.id == @comment.user_id
			@comment.update(description: params[:new_comment])
		end
		respond_to do |format|
			format.htm
			format.js { render partial: 'articles/comments' }
		end
	end

	def create
    	@article = Article.find(params[:id])
    	@article.comments.create(user_id: current_user.try(:id), description: params[:comment])
		respond_to do |format|
			format.html
			format.js { render partial: 'articles/comments' }
		end
	end

	def destroy
		@comment.destroy
		respond_to do |format|
			format.html
			format.js { render partial: 'articles/comments' }
		end
	end

	def report
		@comment.addreport(current_user)
		respond_to do |format|
			format.html
			format.js { render partial: 'articles/comments' }
		end
	end

	def unreport
		@comment.comment_spams.where(user_id: current_user).first.destroy
		respond_to do |format|
			format.html
			format.js { render partial: 'articles/comments' }
		end
	end

	private
	def set_comment
		@comment = Comment.find(params[:id])
	end
	def set_article
		@article = Article.find(@comment.article_id)
	end
end