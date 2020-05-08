class ListsController < ApplicationController
  before_action :redirect_if_not_logged_in 

  def new
    @list = List.new
  end 

  def create
    @user = current_user
    list_fields = list_params 
    list_fields[:user_id] = @user.id
    @list = List.new(list_fields)
    if @list.save 
      redirect_to "/users/#{@user.id}" #users home page 
    else 
      render "/signup" 
    end 
  end 

  def update
    @list = List.find(params[:id])
    @list.update(title: params[:list][:title], content: params [:list][:content])
    redirect_to "/lists"
  end 

  def show 
    list_id = params[:id]
    @list = List.find(list_id)
  end

  private 

  def list_params
    params.require(:list).permit(:title, :content)
  end 

end
