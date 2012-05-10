class TextItemsController < ApplicationController

  def new
    @text_item = TextItem.new
  end

  def create
    @text_item = current_user.text_items.new(params[:text_item])

    if current_user.save
      redirect_to dashboard_path, notice: 'Post was successfully created.'
    else
      @link_item = LinkItem.new
      @image_item = ImageItem.new
      render :template => "dashboard/show"
    end
    # respond_to do |format|
    #   if @text_item.save
    #     format.html { redirect_to dashboard_path, notice: 'Post was successfully created.' }
    #     format.js 
    #   else
    #     # format.html { render action: "new" }
    #     format.json { render json: @link_item.errors, status: :unprocessable_entity }
    #     format.js { render 'reload' }
    #   end
    # end
  end
end
