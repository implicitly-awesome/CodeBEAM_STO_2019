defmodule SuperApp.UserQuery do
  alias SuperApp.{Repo, User}

  def find(user_id), do: Repo.get(User, user_id)

  def by_email(user_email), do: Repo.get_by(User, user_email)
end
