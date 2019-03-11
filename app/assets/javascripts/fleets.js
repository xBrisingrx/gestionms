var computers_table

function modal_delete(id)
{
  $('#modal_delete_client #client_id').val(id)
  $('#modal_delete_client').modal('show')
}

jQuery(document).ready(function($) {

  computers_table = $("#computers_table").DataTable({
    'ajax':'fleets',
    'responsive': true,
    'columns': [
    {'data': 'code'},
    {'data': 'person'},
    {'data': 'ip_address'},
    {'data': 'os'},
    {'data': 'hardware'},
    {'data': 'software'},
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