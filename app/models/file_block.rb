class FileBlock < Block
  field :title
  field :description
  mount_uploader :attachment, AttachmentUploader
end
