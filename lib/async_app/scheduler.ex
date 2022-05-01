defmodule AsyncApp.Scheduler do
  use Quantum, otp_app: :async_app

  alias AsyncApp.GitService
  alias AsyncApp.Account

  def getStuff do
    user = Account.get_user!(1)
    GitService.getContributors(user)
  end
end
