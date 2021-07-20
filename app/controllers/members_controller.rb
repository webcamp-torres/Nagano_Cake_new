class MembersController < ApplicationController
  def index
    @member = current_member 
  end
  
  def show
    @member = current_member 
    @member = Member.find(params[:id])
  end
  def unsubscribe
  end
  
  def edit
    @member = current_member 
  end
  
  def update
    @member = current_member 
    if @member.update(member_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to member_path
    else
      render :edit
    end
  
  end
  
  
end
