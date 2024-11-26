
# Sistema ApoiAR

## Descrição Geral
O ApoiAR é um sistema desenvolvido para facilitar a gestão de serviços de apoio domiciliar. Ele organiza o fluxo de trabalho entre clientes, supervisoras, cuidadores, RH, e financeiro, garantindo eficiência e qualidade no atendimento.

## Estrutura Operacional
1. **Clientes**:
   - Solicitam serviços (apoios).
   - Realizam pagamentos.
   - Avaliam os cuidadores.

2. **Supervisoras**:
   - Recebem as solicitações de apoio dos clientes.
   - Fazem visitas, criam orçamentos e registram no sistema.
   - Selecionam cuidadores conforme a demanda (turnos e tipo de serviço).
   - Acompanham o serviço e gerenciam solicitações e feedbacks.

3. **RH**:
   - Cadastra e treina cuidadores.
   - Classifica cuidadores com base em suas especializações e perfis.

4. **Financeiro**:
   - Supervisiona pagamentos e auditorias financeiras.
   - Gera relatórios financeiros.

5. **Administrador**:
   - Supervisiona todas as operações.
   - Gera relatórios consolidados (financeiros e operacionais).

## Principais Funcionalidades
1. **Gestão de Sessões**:
   - Cadastro, edição e visualização de sessões com cuidadores.

2. **Relatórios**:
   - Relatórios financeiros e de desempenho.

3. **Acompanhamento de Apoios**:
   - Registro detalhado de solicitações, turnos e serviços realizados.

4. **Gestão Hierárquica**:
   - Divisão de responsabilidades entre supervisoras, RH e financeiro.

5. **Login e Controle de Acesso**:
   - Cada ator do sistema acessa apenas as funcionalidades específicas do seu papel.

## Fluxo de Trabalho
1. Cliente solicita um serviço (apoio).
2. Supervisora faz uma visita e cria um orçamento.
3. RH cadastra cuidadores e suas especializações.
4. Supervisora seleciona cuidadores e organiza os turnos.
5. Cliente realiza o pagamento.
6. Supervisora acompanha o serviço, garante qualidade e resolve solicitações adicionais.

## Tecnologias Utilizadas
- **Linguagem**: Ruby on Rails (versão 7.1.5).
- **Banco de Dados**: PostgreSQL.
- **Front-end**: Bootstrap e SCSS para responsividade.
- **Testes**: RSpec e Capybara.

## Configuração do Sistema
1. Clone o repositório.
2. Configure o banco de dados no arquivo `config/database.yml`.
3. Execute as migrações: `rails db:migrate`.
4. Rode o servidor: `rails server`.

## Desenvolvedores
- **Nome**: Alessandra Oliveira
- **Contato**: alessandrars.adm@gmail.com

---
