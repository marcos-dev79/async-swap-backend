defmodule AsyncApp.Scheduler do
  use Quantum, otp_app: :async_app

  alias AsyncApp.GitService
  alias AsyncApp.Account
  alias AsyncApp.GitRepo.Body
  alias AsyncApp.GitRepo.Issue
  alias AsyncApp.GitRepo.Contributor

  def getStuff do
    Account.list_users() |> Enum.each(
      fn (us) ->
        {:ok, contributors} = GitService.getContributors(us)
        {:ok, issues} = GitService.getIssues(us)

        body = %Body{
          user: us.username,
          repository: us.repository,
          issues: Poison.decode!(issues.body) |> Enum.map(
            fn(iss) ->
              label = Enum.map(iss["labels"], fn(x) -> x["name"] end)
              %Issue{title: iss["title"], authorandlabels: iss["user"]["login"] <> " " <>  Enum.join(label, ", "), repository: us.repository }
            end
          ),
          contributors: Poison.decode!(contributors.body) |> Enum.map(
            fn(cont) ->
              %Contributor{name: cont["type"], user: cont["login"], qtd_commits: 0, repository: us.repository}
            end
          )
        }

        url = System.get_env("WEBHOOK")
        headers = [{"Content-type", "application/json"}]
        HTTPoison.post(url, Poison.encode!(body), headers, [])

      end
    )

  end
end
