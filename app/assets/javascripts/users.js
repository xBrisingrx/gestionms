var users_table

function modal_delete_user( id )
{
  $('#modal_delete_user #user_id').val( id )
  $('#modal_delete_user').modal('show')
}

function delete_user()
{
  let user_id = $('#modal_delete_user #user_id').val( )
  $.ajax({
    url: 'users/'+user_id+'/disable',
    type: 'GET',
    dataType: 'JSON',
    success: function(msg){
      if (msg.status === 'success') {
        users_table.ajax.reload(null,false)
        $('#modal_delete_user').modal('hide')
        new Noty({
            theme: 'bootstrap-v4',
            type: 'success ',
            layout: 'topRight',
            text: " Baja exitosa ",
            timeout: ( true, 1000 )
        }).show()
      } else {
        alert('Ocurrio un error al eliminar a la usera')
      }
    },
    error: function(msg){
      alert('Ocurrio un error al eliminar a la usera')
    }
  })
  .fail(function(msg) {
    console.log("error: " + msg.status)
  })
}

jQuery(document).ready(function($) {
  $('.select-users').select2({ width: '100%',theme: "bootstrap4" })

  users_table = $("#users_table").DataTable({
    'ajax':'users',
    'responsive' : true,
    'columns': [
    {'data': 'username'},
    {'data': 'email'},
    {'data': 'client_name'},
    {'data': 'person_name'},
    {'data': 'actions'}
    ]
  })


})