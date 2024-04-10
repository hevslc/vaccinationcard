defmodule Vaccinationcard.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      VaccinationcardWeb.Telemetry,
      Vaccinationcard.Repo,
      {DNSCluster, query: Application.get_env(:vaccinationcard, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Vaccinationcard.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Vaccinationcard.Finch},
      # Start a worker by calling: Vaccinationcard.Worker.start_link(arg)
      # {Vaccinationcard.Worker, arg},
      # Start to serve requests, typically the last entry
      VaccinationcardWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Vaccinationcard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VaccinationcardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
