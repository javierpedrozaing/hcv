json.extract! consultorio, :id, :nombre, :direccion, :telefono, :municipio_id, :created_at, :updated_at
json.url consultorio_url(consultorio, format: :json)