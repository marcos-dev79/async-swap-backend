defmodule AsyncApp.GitService do

  def getIssues(user) do
    token = getToken()
    url = "https://api.github.com/repos/#{user.username}/#{user.repository}/issues"
    headers = ["Authorization": "Bearer #{token}", "Accept": "Application/json; Charset=utf-8"]
    options = [ssl: [{:versions, [:'tlsv1.2']}], recv_timeout: 500]
    HTTPoison.get(url, headers, options)
  end

  def getContributors(user) do
    token = getToken()
    url = "https://api.github.com/repos/#{user.username}/#{user.repository}/collaborators"
    headers = ["Authorization": "Bearer #{token}", "Accept": "Application/json; Charset=utf-8"]
    options = [ssl: [{:versions, [:'tlsv1.2']}], recv_timeout: 500]
    HTTPoison.get(url, headers, options)
  end

  defp getToken do
    System.get_env("TOKEN")
  end

end
