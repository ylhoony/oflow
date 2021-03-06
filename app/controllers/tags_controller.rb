class TagsController < ApplicationController
  before_action :require_signed_in?
  before_action :require_valid_access?, only: [:edit, :update]
  before_action :set_tag, only: [:edit, :update]

  def index
    @tags = current_company.tags.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path
    else
      render :new
    end
  end

  private

    def require_valid_access?
      redirect_to tags_path unless current_company.tag_ids.include?(params[:id].to_i)
    end

    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name, :company_id)
    end

end
