ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Tarantino.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Tarantino.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Tarantino.Repo)

