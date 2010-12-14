class TextBlocksController < BlocksController

  def new
    @block = TextBlock.new
  end

  def edit
    @block = TextBlock.find(params[:id])
  end

  def create
    @block = TextBlock.new(params[:text_block])

    if @block.save
      @site.blocks << @block
      redirect_to(@site, :notice => 'Блок успешно создан.')
    else
      render :action => "new"
    end
  end

  def update
    @block = TextBlock.find(params[:id])

    if @block.update_attributes(params[:text_block])
      redirect_to(@site, :notice => 'Блок успешно изменен.')
    else
      render :action => "edit"
    end
  end
end
