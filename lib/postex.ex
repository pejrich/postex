defmodule Postex do
  use Application

  @api_url "https://api.postmates.com/"
  @api_version "v1/"

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = []

    opts = [strategy: :one_for_one, name: Postex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def process_response_body(body) do
    Jason.decode!(body)
  end

  def api_url(), do: @api_url

  def customer_prefix(), do: @api_version <> "customers/"

  def customer_id() do
    Application.get_env(:postex, :customer_id) || System.get_env("POSTMATES_CUSTOMER_ID")
  end

  def api_key do
    Application.get_env(:postex, :api_key) || System.get_env("POSTMATES_API_KEY")
  end

  def auth_header() do
    encoded_auth = Base.url_encode64(api_key() <> ":")
    Map.new(Authorization: "Basic " <> encoded_auth)
  end
end
