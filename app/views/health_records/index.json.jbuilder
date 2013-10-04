json.array!(@health_records) do |health_record|
  json.extract! health_record, :date, :time_period, :health
  json.url health_record_url(health_record, format: :json)
end
