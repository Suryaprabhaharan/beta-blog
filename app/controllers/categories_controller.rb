class CategoriesController < ApplicationController
	before_action :set_category, only: [:edit, :show, :update]
	before_action :require_admin, except: [:show, :index]
	def new
		@category = Category.new
	end

	def index
		@category = Category.includes(articles: :user).paginate(page: params[:page],per_page: 4)
	end
	def edit

	end

	def update
		if @category.update(category_params)
			flash[:success] = "Category updated successfully"
			redirect_to categories_path
		else
			render 'edit'
		end
	end

	def show
		@category_article = @category.articles.paginate(page: params[:page], per_page: 4)
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category created successfully"
			redirect_to categories_path
		else
			render 'new'
		end
	end

	private
		def set_category
			@category = Category.find(params[:id])
		end
		def category_params
			params.require(:category).permit(:name)
		end
		def require_admin
			if !logged_in? || (logged_in? and !current_user.admin?)
				flash[:danger] = "Only admins can do that"
				redirect_to categories_path
			end
		end
end