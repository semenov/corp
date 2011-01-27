class Block
  include Mongoid::Document
  referenced_in :site
  before_destroy :remove_from_site
  
  def move_up
    ids = site.block_ids
    index = ids.index(id)
    return false if index.nil? or index == 0
    ids[index - 1], ids[index] = ids[index], ids[index - 1]
    site.save
    return true
  end
  
  def move_down
    ids = site.block_ids
    index = ids.index(id)
    return false if index.nil? or index == ids.count - 1
    ids[index + 1], ids[index] = ids[index], ids[index + 1]
    site.save
    return true
  end
  
  protected
  
  def remove_from_site
    site.block_ids.delete(id)
    site.save
  end
end
