defmodule Postex.Client do
  use HTTPoison.Base

  def get_delivery_quote(pickup_address, dropoff_address, client_id \\ nil) do
    url = Postex.Url.delivery_quote_url(client_id)
    body = {:form, [dropoff_address: dropoff_address_val, pickup_address: pickup_address_val]}
    headers = Postex.auth_header()
    post!(url, body, headers)
  end
end
