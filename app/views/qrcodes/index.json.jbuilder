json.array!(@qrcodes) do |qrcode|
  json.extract! qrcode, :id, :product_id, :qrcode_img
  json.url qrcode_url(qrcode, format: :json)
end
