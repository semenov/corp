class ContactBlock < Block
  field :title, :default => 'Контактная информация'
  field :phone
  field :additional_phone
  field :fax
  field :email
  field :address
  field :working_time
  field :info
end
