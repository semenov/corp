class BlocksController < ApplicationController
  respond_to :html
  
  before_filter :find_site
  
  def find_site
    @site = Site.find(params[:site_id])
  end

  def new
    @block = block_class.new
  end

  def edit
    @block = block_class.find(params[:id])
  end

  def create
    @block = block_class.new(block_params)

    if @block.save
      @site.blocks << @block
      redirect_to(@site, :notice => 'Блок успешно создан.')
    else
      render :action => "new"
    end
  end

  def update
    @block = block_class.find(params[:id])

    if @block.update_attributes(block_params)
      redirect_to(@site, :notice => 'Блок успешно изменен.')
    else
      render :action => "edit"
    end
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
    redirect_to(@site, :notice => 'Блок удален.')
  end
  
  protected
  
  def block_params
    params[block_class.name.underscore.to_sym]
  end

end
