users_table.ajax.reload(null,false)
$("#modal-user").modal('hide')

new Noty({
    theme: 'bootstrap-v4',
    type: 'success ',
    layout: 'topRight',
    text: " Usuario registrado con exito ",
    timeout: ( true, 1000 )
}).show()