class ImageBlock < Block
  field :description
  mount_uploader :image, ImageUploader
end
