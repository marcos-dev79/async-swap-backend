defmodule AsyncApp.GitService do

  def getIssues(user) do
    token = getToken()
    url = "https://api.github.com/repos/mriso79/gearkit/issues"
    headers = ["Authorization": "Bearer #{token}", "Accept": "Application/json; Charset=utf-8"]
    options = [ssl: [{:versions, [:'tlsv1.2']}], recv_timeout: 500]
    {:ok, response} = HTTPoison.get(url, headers, options)
    response
  end

  def getContributors(user) do
    token = getToken()
    url = "https://api.github.com/repos/mriso79/gearkit/collaborators"
    headers = ["Authorization": "Bearer #{token}", "Accept": "Application/json; Charset=utf-8"]
    options = [ssl: [{:versions, [:'tlsv1.2']}], recv_timeout: 500]
    {:ok, response} = HTTPoison.get(url, headers, options)
    response
  end

  defp getToken do
    System.get_env("TOKEN")
  end

end
