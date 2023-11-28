class CategoriesController < ApplicationController
  before_action :admin_required
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(set_category_params)
        format.html { redirect_to categories_path, notice: "Category Updated Successfully" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @category.destroy
        format.html { redirect_to categories_path, notice: "Category Deleted Successfully" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def create
    @category = Category.new(set_category_params)
    @category.creator = authenticated_user
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Category Created Successfully" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
