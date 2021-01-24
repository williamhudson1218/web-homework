# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Homework.Repo.insert!(%Homework.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Homework.Repo

alias Homework.Companies.Company
alias Homework.Merchants.Merchant
alias Homework.Transactions.Transaction
alias Homework.Users.User

Repo.insert! %User{
  dob: "12/18/1990",
  first_name: "Will",
  last_name: "Hudson",
  inserted_at: NaiveDateTime.local_now(),
  updated_at: NaiveDateTime.local_now()
}

Repo.insert! %User{
  dob: "09/10/1995",
  first_name: "Thomas",
  last_name: "Frederickson",
  inserted_at: NaiveDateTime.local_now(),
  updated_at: NaiveDateTime.local_now()
}

Repo.insert! %Company{
  name: "Hudson Helicoptors",
  credit_line: 10000,
  available_credit: 10000
}

Repo.insert! %Merchant{
  name: "Some merchant",
  description: "some description",
  inserted_at: NaiveDateTime.local_now(),
  updated_at: NaiveDateTime.local_now()
}

Repo.insert! %Transaction{
  user_id: "b91a460a-89ae-493a-a00b-44242ada2add",
  merchant_id: "bb204507-057b-4605-a1bb-5a2951bd4ce7",
  amount: 1500,
  credit: true,
  debit: false,
  description: "Flights to LA"
}
