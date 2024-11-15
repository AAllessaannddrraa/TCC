<h1>Lista de Pacientes</h1>
<table class="table">
  <thead>
    <tr>
      <th>Nome</th>
      <th>Contato</th>
      <th>Ações</th>
    </tr>
  </thead>
  <tbody>
    <% @pacientes.each do |paciente| %>
      <tr>
        <td><%= paciente.nome %></td>
        <td><%= paciente.numero_contato %></td>
        <td>
          <%= link_to 'Mostrar', paciente %>
          <%= link_to 'Editar', edit_paciente_path(paciente) %>
          <%= link_to 'Excluir', paciente, method: :delete, data: { confirm: 'Tem certeza?' } %>
        </td>
      </tr>
    <% end %>
  </tbody>
</table>
<%= link_to 'Novo Paciente', new_paciente_path, class: 'btn btn-primary' %>
