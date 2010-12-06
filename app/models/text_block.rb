class TextBlock < Block
  field :content
  validates_presence_of :content
end
