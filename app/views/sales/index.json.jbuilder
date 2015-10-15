json.array!(@sales) do |sale|
  json.extract! sale, :id, :date, :value, :sale_items
end