class Site
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title
  field :slug
  field :description
  references_many :blocks, :stored_as => :array, :inverse_of => :site
  
  validates_presence_of :title, :slug
  validates_uniqueness_of :slug
  
  def ordered_blocks
    blocks_by_id = {}
    blocks.each do |block|
      blocks_by_id[block.id] = block
    end
    ordered = []
    block_ids.each do |block_id|
      ordered << blocks_by_id[block_id]
    end
    return ordered
  end
end
