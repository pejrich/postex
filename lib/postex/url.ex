defmodule Postex.Url do
  @api_key Postex.api_key()
  @api_url Postex.api_url()
  @customer_prefix Postex.customer_prefix()
  @customer_id Postex.customer_id()

  def delivery_quote_url(customer_id \\ nil) do
    customer_id = customer_id || @customer_id
    @api_url <> @customer_prefix <> customer_id <> "/delivery_quotes"
  end
end
