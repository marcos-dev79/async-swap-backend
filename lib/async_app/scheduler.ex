defmodule AsyncApp.Scheduler do
  use Quantum, otp_app: :async_app

  alias AsyncApp.GitService
  alias AsyncApp.Account

  def getStuff do
    Account.list_users() |> Enum.each(
      fn (us) ->
        {:ok, contributors} = GitService.getContributors(us)
        {:ok, issues} = GitService.getIssues(us)

        url = System.get_env("WEBHOOK")
        body = Poison.encode!(contributors.body <> "," <> issues.body)
        headers = [{"Content-type", "application/json"}]
        HTTPoison.post(url, body, headers, [])
      end
    )

  end
end
