class Admin::MembersController < ApplicationController
   before_action :authenticate_admin!
   def index
     
     @members = Member.all.page(params[:page]).per(10)
   end

   def show
      @member = Member.find(params[:id])
   end

   def edit
      @member = Member.find(params[:id])
   end

   def update
      @member = Member.find(params[:id])
      if @member.update(member_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to admin_member_path
      else
      render :edit
      end
   end
   
   private
	def member_params
	  params.require(:member).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:phone_number,:email,:unsubscribe_status)
	end
end
