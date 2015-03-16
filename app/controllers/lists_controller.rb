class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List successfully saved!"
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "List successfully updated!"
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:alert] = "List successfully deleted!"
    end
    redirect_to lists_path
  end

private
  def list_params
    params.require(:list).permit(:name, :description)
  end
end
