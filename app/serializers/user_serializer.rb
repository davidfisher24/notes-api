class UserSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :email, :name, :created_at, :updated_at
end
