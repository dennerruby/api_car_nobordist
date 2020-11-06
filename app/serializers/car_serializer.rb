class CarSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :marca, :veiculo, :ano, :descricao, :vendido, :created_at
end
