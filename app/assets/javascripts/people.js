var people_table

function modal_delete_person( id, client_id )
{
  $('#modal_delete_person #person_id').val( id )
  $('#modal_delete_person #client_id').val( client_id )
  $('#modal_delete_person').modal('show')
}

function delete_person()
{
  let client_id = $('#modal_delete_person #client_id').val(  )
  let id = $('#modal_delete_person #person_id').val( )
  $.ajax({
    url: 'people/'+id+'/disable',
    dataType: 'JSON',
    type: 'GET',
    success: function(msg){
      if (msg.status === 'success') {
        people_table.ajax.reload(null,false)
        $('#modal_delete_person').modal('hide')
        new Noty({
          theme: 'bootstrap-v4',
          type: 'success ',
          layout: 'topRight',
          text: " Persona dada de baja con exito ",
          timeout: ( true, 1000 )
        }).show()
      } else {
        new Noty({
          theme: 'bootstrap-v4',
          type: 'success ',
          layout: 'topRight',
          text: " No se pudo dar de baja a la persona ",
          timeout: ( true, 1000 )
        }).show()
      }
    },
    error: function(msg){
      alert('Ocurrio un error al eliminar a la persona')
    }
  })
  .fail(function(msg) {
    console.log("error: " + msg.status + ' ' + msg);
  })
}

jQuery(document).ready(function($) {
  people_table = $('#people_table').DataTable({
    'ajax': 'people',
    'columns': [
      {'data': 'name' },
      {'data': 'surname' },
      {'data': 'dni' },
      {'data': 'email' },
      {'data': 'phone' },
      {'data': 'actions' }
    ]
  })

}) // End JQuery document ready