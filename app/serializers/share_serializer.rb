class ShareSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :note, :user
end
