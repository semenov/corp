class BlocksController < ApplicationController
  before_filter :find_site
  
  def find_site
    @site = Site.find(params[:site_id])
  end

  def move_up
    @block = Block.find(params[:id])
    @block.move_up
    redirect_to @site
  end
  
  def move_down
    @block = Block.find(params[:id])
    @block.move_down
    redirect_to @site
  end
  
  def destroy
    @block = Block.find(params[:id])
    @block.destroy
  end
end
