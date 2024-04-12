# Vaccinationcard - Desafio BTG

Esse projeto implementa o backend de uma [página de administração de carteira de vacinação](http://esaude.curitiba.pr.gov.br/eGovSaude_Help2/PRT/Atendimento/VacinaResgateAplicacaoPainel.htm).
Foi considerado possíveis lógicas de uma implementação de front posterior e possue as principais funções para dar suporte ao front.

Foi implementado tabela de Usuários (criação e busca) e tabela de Vacinações (criação, atualização e busca).
Cada vacinação possue um id do usuário correspondente.

### Execução

  * `mix setup` para instalar e configurar as dependências
  * `mix run priv/repo/seeds.exs` para popular dados de exemplos
  * Inicie o endpoint com `mix phx.server`. Porta: 4000

  Os dados de exemplos se encontram no arquivo `priv/repo/seeds.exs` e podem ser usados como base para criação de usuários e vacinações.
  Pode usar uma ferramenta para requesta como o Postman, e inserir os dado em formato json.

### Rotas

| Método            | Rota     | Parâmetros |
| :---------------- | :------ | :---- |
| get               |  `/PesquisaUsuarioPordocumento/`   | `cpf`, `rg` ou `national_card` |
| get               |  `/PesquisaCartaoDeVacinacao/`     | `user_id` |
| post              |  `/CriarVacina/`                   | parâmetros da vacinação |
| post              |  `/AtualizarVacina/`               | `ìd` |
| post              |  `/CriarUsuario/`                  | parâmetros de usuário |

Parâmetros de usuário
```
 :name,              :string
 :gender,            :string
 :national_card,     :integer
 :rg,                :string
 :cpf,               :string
 :date_of_birth,     :date
 :mother_name,       :string
 :father_name,       :string
 :situation,         :string
 :address,           :string
 :address_number,    :integer
 :city,              :string
 :birthplace,        :string
```

Parâmetros de vacinação
```
:name,   :string
:dose,   :integer
:type,   :string
:date,   :date
:lote,   :string
:user_id :integet
```

<br /><br />

> Por Hevelyn Sthefany Lima de Carvalho
