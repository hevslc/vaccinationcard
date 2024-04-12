# Vaccinationcard

## Desafio BTG

Esse projeto implementa o backend de uma (página de administração de carteira de vacinação)[http://esaude.curitiba.pr.gov.br/eGovSaude_Help2/PRT/Atendimento/VacinaResgateAplicacaoPainel.htm].
Foi considerado possíveis lógicas de uma implementação de front posterior e possue as principais funções para dar suporte ao front.

Foi implementado tabela de Usuários (criação e busca) e tabela de Vacinações (criação, atualização e busca).
Cada vacinação possue um id do usuário correspondente.

### Execução

  * `mix setup` para instalar e configurar as dependências
  * `mix run priv/repo/seeds.exs` para popular dados de exemplos
  * Inicie o endpoint com `mix phx.server`

  Os dados de exemplos se encontram no arquivo `priv/repo/seeds.exs` e podem ser usados como base para criação de usuários e vacinações.

### Rotas

  * (GET)  `/PesquisaUsuarioPordocumento/`
  * (GET)  `/PesquisaCartaoDeVacinacao/`
  * (POST) `/CriarVacina/`
  * (POST) `/AtualizarVacina/`
  * (POST) `/CriarUsuario/`



Por Hevelyn Sthefany Lima de Carvalho
