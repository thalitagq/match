json.extract! cliente, :id, :nome, :estado, :advogado_id, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
