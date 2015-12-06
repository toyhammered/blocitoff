module ItemsHelper
  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    redirect_to :back if @item.nil?
    flash[:error] = "You do not have the authority to do that task"
  end
end
