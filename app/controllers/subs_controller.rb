class SubsController < ApplicationController
  before_action :is_moderator, only: [:edit, :destroy]

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    if @sub.save
      flash[:notice] = "Sub Created"
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      flash[:notice] = "Successfully updated"
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id]).destroy
    flash[:notice] = "'#{@sub.title}' deleted"
    redirect_to subs_url
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
