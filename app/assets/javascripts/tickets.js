var open_tickets_table
var closed_tickets_table


jQuery(document).ready(function($) {
  let btn_show_answer = true
  
  $('#ticket_client_id').select2({ width: '100%',theme: "bootstrap4" })
  $('#ticket_assigned_to').select2({ width: '100%',theme: "bootstrap4" })
  $('#ticket_person_id').select2({ width: '100%',theme: "bootstrap4" })

  $('#form-ticket').validate({
    rules: {
      'ticket[client_id]': {
        required: true,
        // Using the normalizer to trim the value of the element
        // before validating it.
        //
        // The value of `this` inside the `normalizer` is the corresponding
        // DOMElement. In this example, `this` references the `username` element.
        normalizer: function(value) {
          return $.trim(value);
        }
      },
      'ticket[title]': {
        required: true
      },
      'ticket[type_ticket]': {
        required: true
      }
    }
  })


  $("#ticket_client_id").on('change', function(event) {
    // $.ajax({
    //   url: '/clients/' + $("#ticket_client_id").val() + '/fleets.json',
    //   type: 'GET',
    //   dataType: 'JSON',
    //   success: function ( resp ) {
    //     $('#ticket_fleet_id').find('option').remove().end().append('<option value="" disabled selected>Seleccione un equipo</option>');
    //     $( resp.data ).each(function(i, element){
    //       $("#ticket_fleet_id").append("<option value="+element.id +">"+element.code +"</option>")
    //     })
    //   }
    // })

    $.ajax({
      url: '/clients/' + $(this).val() + '/people',
      type: 'GET',
      dataType: 'JSON',
      success: function ( resp ) {
        $('#ticket_person_id').find('option').remove().end().append('<option value="" disabled selected>Solicito el servicio</option>');
        $( resp.data ).each(function(i, element){
          console.log( element.name )
          $("#ticket_person_id").append("<option value="+element.id +">"+element.name + " " + element.surname + "</option>")
        })
      }
    })
  }) // End on change

  $(".show_answer").on('click', function(event) {
    console.log('click answer')
    if( btn_show_answer ) {
      $('#answer').show("slow")
      btn_show_answer = false
    } else {
      $('#answer').hide(1000)
      btn_show_answer = true
    }
  })

  $('.close_ticket_btn').on('click', function(event) {
    // Le asignamos el id del ticket al modal
    console.log('click')
    $('#close_ticket_id').val( $(this).data('id') )
    console.log('id: ' + $(this).data('id'))
  })

  function modal_close_ticket(id)
  {
    $('#close_ticket_id').val( id )
    $('#modal_close_ticket').modal('show')
  }

  $('.btn_destroy_ticket').on('click', function(event) {
    console.log('cerrar: ' + $('#close_ticket_id').val())
    $.ajax({
      url: 'tickets/' + $('#close_ticket_id').val()+ '/tickets/close_ticket/',
      success: function (msg){
        console.log(msg.status)
        $('#modal_close_ticket').modal('hide')
        location.reload()
      },
      error: function(msg){
        console.log('error ajax')
      }
    })
  })

  open_tickets_table = $('#open_tickets_table').DataTable({
                          'ajax':'tickets',
                          'responsive' : true,
                          'columns': [
                          {'data': 'date'},
                          {'data': 'type'},
                          {'data': 'client'},
                          {'data': 'assigned'},
                          {'data': 'title'},
                          {'data': 'actions'} ] })

}) // End JQuery

// /tickets/:id/tickets/inactive