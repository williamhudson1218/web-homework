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

#insert companies

hudsonhelicopters = Repo.insert! %Company{
  name: "Hudson Helicoptors",
  credit_line: 2500000,
  available_credit: 2500000
 }

 divvy = Repo.insert! %Company{
  name: "Divvy",
  credit_line: 15000000,
  available_credit: 15000000
 }

 smarttech = Repo.insert! %Company{
  name: "Smart Tech",
  credit_line: 2000000,
  available_credit: 2000000
 }

 company_list = [hudsonhelicopters.id]

 #insert users

willhudson = Repo.insert! %User{
  dob: "09/10/2020",
  first_name: "Will",
  last_name: "Hudson",
  company_id: hudsonhelicopters.id
}

bobmarley = Repo.insert! %User{
  dob: "03/01/2000",
  first_name: "Bob",
  last_name: "Marley",
  company_id: hudsonhelicopters.id
}

chucknorris = Repo.insert! %User{
  dob: "05/15/1950",
  first_name: "Chuck",
  last_name: "Norris",
  company_id: hudsonhelicopters.id
}

tomhanks = Repo.insert! %User{
  dob: "05/15/1950",
  first_name: "Tom",
  last_name: "Hanks",
  company_id: hudsonhelicopters.id
}

users_hudson_helicopters = [willhudson.id, bobmarley.id, chucknorris.id, tomhanks.id]

marcopolo = Repo.insert! %User{
  dob: "09/10/2020",
  first_name: "Marco",
  last_name: "Polo",
  company_id: divvy.id
}

stevecarell = Repo.insert! %User{
  dob: "03/01/2000",
  first_name: "Steve",
  last_name: "Carell",
  company_id: divvy.id
}

fredricohansen = Repo.insert! %User{
  dob: "05/15/1950",
  first_name: "Fredrico",
  last_name: "Hansen",
  company_id: divvy.id
}

timallen = Repo.insert! %User{
  dob: "05/15/1950",
  first_name: "Tim",
  last_name: "Allen",
  company_id: divvy.id
}

users_divvy = [marcopolo.id, stevecarell.id, fredricohansen.id, timallen.id]

#insert merchants

somemerchant = Repo.insert! %Merchant{
  name: "Some merchant",
  description: "some description",
  inserted_at: NaiveDateTime.local_now(),
  updated_at: NaiveDateTime.local_now()
}

anothermerchant = Repo.insert! %Merchant{
  name: "Merchants Are Us",
  description: "We are a group of merchants that do things that merchants do",
  inserted_at: NaiveDateTime.local_now(),
  updated_at: NaiveDateTime.local_now()
}

merchant_list = [somemerchant.id, anothermerchant.id]

#list of transaction descriptions
description_list = ["Food", "Shelter", "Fun", "Work", "Boating", "Pizza Party", "Fake Mustaches", "Hot air balloon ride with squad", "Taylor Swift Concert", "Company Picnic", "Cheap Hair Cut", "Food for all nighter", "Massage"]

#list of transaction amounts
amount_list = [2345, 52354, 54323, 1234, 6543, 53245, 2345, 6532, 8987, 454, 234, 123]

#insert hudson helicopters transactions
(1..100) |> Enum.each(fn _ -> Repo.insert! %Transaction{user_id: Enum.random(users_hudson_helicopters), merchant_id: Enum.random(merchant_list), amount: Enum.random(amount_list), credit: true, debit: true, description: Enum.random(description_list), company_id: hudsonhelicopters.id}
end)

#insert divvy transactions
(1..100) |> Enum.each(fn _ -> Repo.insert! %Transaction{user_id: Enum.random(users_divvy), merchant_id: Enum.random(merchant_list), amount: Enum.random(amount_list), credit: true, debit: true, description: Enum.random(description_list), company_id: divvy.id}
end)
