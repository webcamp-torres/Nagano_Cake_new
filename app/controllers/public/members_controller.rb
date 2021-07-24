class Public::MembersController < ApplicationController
  
  def my_page
    @member = current_member 
  end
  
  def unsubscribe
    @member = current_member 
    
    
  end
  def unsubscribe_status
    member = current_member
    member.update(unsubscribe_status: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
    
  end
  
  
 
  
  def edit
    @member = current_member
  end
  
  def update
    @member = current_member
    if @member.update(member_params)
      flash[:notice] = "登録情報を変更しました"
      @member.save
      redirect_to members_my_page_path
    else
      render :edit
    end
  
  
  end
  
 private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  
  end

  
end
