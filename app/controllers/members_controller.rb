class MembersController < ApplicationController
  
  
  def show
    @member = current_member 
    @member = Member.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  
end
