# alias Vaccinationcard.Models.User
# alias Vaccinationcard.Models.Vaccination
# alias Vaccinationcard.Repo
# import Ecto.Query

# users_params = [
#   %{
#     name: "Ana Paula Lima Gregório",
#     gender: "feminino",
#     national_card: 111000,
#     rg: "0001111000",
#     cpf: "01191161100",
#     date_of_birth: Date.from_iso8601("1995-01-11") |> elem(1),
#     mother_name: "Regina Lima",
#     father_name: "Roberto Gregório",
#     situation: "cadastrada",
#     address: "Rua Laranja",
#     address_number: 1001,
#     city: "Rio de Janeiro",
#     birthplace: "Rio de Janeiro",
#   },
#   %{
#     name: "Bruno Oliveira Santos",
#     gender: "masculino",
#     national_card: 222000,
#     rg: "0002222000",
#     cpf: "02292262200",
#     date_of_birth: Date.from_iso8601("2000-02-22") |> elem(1),
#     mother_name: "Angela Oliveira",
#     father_name: "Marcelo Santos",
#     situation: "cadastrada",
#     address: "Rua do Bem",
#     address_number: 1001,
#     city: "São Paulo",
#     birthplace: "Ilhéus",
#   },
# ]

# vaccinations_params = [
#   %{
#     user_id: 1,
#     name: "Hepatite B",
#     dose: 1,
#     type: "Faltoso",
#     date: nil,
#     lote: "Teste",
#   },
#   %{
#     user_id: 1,
#     name: "Anti-Polio (SABIN)",
#     dose: 1,
#     type: "Aplicação",
#     date:  Date.from_iso8601("2024-01-22") |> elem(1),
#     lote: "Teste",
#   },
#   %{
#     user_id: 1,
#     name: "Anti-Polio (SABIN)",
#     dose: 2,
#     type: "Indicação",
#     date: nil,
#     lote: "Teste",
#   },
#   %{
#     user_id: 1,
#     name: "Tetravalente",
#     dose: 1,
#     type: "Resgate",
#     date: nil,
#     lote: "Teste",
#   },
# ]


# now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
# offers_changesets = Enum.map(users_params, fn user ->
#   Map.merge(user, %{inserted_at: now, updated_at: now})
# end)

# vaccination_changesets = Enum.map(vaccinations_params, fn vaccination ->
#   Map.merge(vaccination, %{inserted_at: now, updated_at: now})
# end)

# Repo.insert_all(User, offers_changesets)
# Repo.insert_all(Vaccination, vaccination_changesets)
