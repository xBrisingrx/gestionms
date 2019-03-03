var clients_table

function modal_delete(id)
{
  $('#modal_delete_client #client_id').val(id)
  $('#modal_delete_client').modal('show')
}

jQuery(document).ready(function($) {

  clients_table = $("#clients_table").DataTable({
    'ajax':'clients',
    'columns': [
    {'data': 'name'},
    {'data': 'cuit'},
    {'data': 'email'},
    {'data': 'direction'},
    {'data': 'actions'}
    ]
  })


$("#form_disable_client").on("ajax:success", function(event) {
    clients_table.ajax.reload(null,false)
    new Noty({
        theme: 'bootstrap-v4',
        type: 'success ',
        layout: 'topRight',
        text: " Baja exitosa ",
        timeout: ( true, 1000 )
  }).show()
    $("#modal_delete_client").modal('hide')
  }).on("ajax:error", function(event) {
  new Noty({
        theme: 'bootstrap-v4',
        type: 'error ',
        layout: 'topRight',
        text: " error! ",
        timeout: ( true, 1000 )
  }).show()
})


})