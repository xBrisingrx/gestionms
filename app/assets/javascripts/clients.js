var clients_table

function modal_delete(id)
{
  $('#modal_delete_client #client_id').val(id)
  $('#modal_delete_client').modal('show')
}

jQuery(document).ready(function($) {

  clients_table = $("#clients_table").DataTable({
    'ajax':'clients',
    'responsive': true,
    'columns': [
    {'data': 'name'},
    {'data': 'email'},
    {'data': 'direction'},
    {'data': 'actions'}
    ],
    'language': { 'url': "/assets/dataTables/Spanish.json"}
  })

  $("#form_disable_client").on("ajax:success", function(event) {
      $("#modal_delete_client").modal('hide')
      noty_alert('success', 'Cliente eliminado')
    }).on("ajax:error", function(event) {
    noty_alert('error', 'No se pudo eliminar al cliente')
  })


})