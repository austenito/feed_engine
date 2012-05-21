class ImageItemsController < ApplicationController
  def create
    @image_item = current_user.image_items.new(params[:image_item])

    if @image_item.save
      respond_to do |format|
        format.js
        format.html do
          redirect_to dashboard_path, notice: 'Image was successfully created.'
        end
      end
    else
      @text_item = TextItem.new
      @link_item = LinkItem.new
      render :template => "dashboard/show"
    end
  end
end
