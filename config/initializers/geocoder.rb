Geocoder.configure(
  lookup: :google,
  api_key: ENV['GOOGLE_KEY'],
  use_https: true,
  units: :km
)
