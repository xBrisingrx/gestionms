var process_tickets_table
var closed_tickets_table
var open_tickets_table

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

function count_tickets()
{
  $.ajax({
    url: 'count_tickets',
    type: 'GET',
    dataType: 'JSON',
    success: function( msg ) {
      console.log( msg )
    },
    error: function( msg ) {
      console.log( msg )
    }
  })
}

jQuery(document).ready(function($) {
  let btn_show_answer = true
  $('.select-ticket').select2({ width: '100%',theme: "bootstrap4" })
  count_tickets()
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


  $("#form-ticket #ticket_client_id").on('change', function(event) {
    $.ajax({
      url: '/clients/' + $(this).val() + '/fleets',
      type: 'GET',
      dataType: 'JSON',
      success: function ( resp ) {
        $('#form-ticket #ticket_fleet_id').find('option').remove().end().append('<option value="" disabled selected>Seleccione un equipo</option>');
        $( resp.data ).each(function(i, element){
          console.log( element.code )
          $("#ticket_fleet_id").append("<option value="+element.id +">"+element.code +"</option>")
        })
      }
    })

    $.ajax({
      url: '/clients/' + $(this).val() + '/people',
      type: 'GET',
      dataType: 'JSON',
      success: function ( resp ) {
        $('#form-ticket #ticket_person_id').find('option').remove().end().append('<option value="" disabled selected>Solicito el servicio</option>');
        $( resp.data ).each(function(i, element){
          console.log( element.name )
          $("#form-ticket #ticket_person_id").append("<option value="+element.id +">"+element.name + " " + element.surname + "</option>")
        })
      }
    })
  }) // End on change

  $("#form-ticket-varios #ticket_client_id").on('change', function(event) {
    $.ajax({
      url: '/clients/' + $(this).val() + '/people',
      type: 'GET',
      dataType: 'JSON',
      success: function ( resp ) {
        $('#form-ticket-varios #ticket_person_id').find('option').remove().end().append('<option value="" disabled selected>Solicito el servicio</option>');
        $( resp.data ).each(function(i, element){
          console.log( element.name )
          $("#form-ticket-varios #ticket_person_id").append("<option value="+element.id +">"+element.name + " " + element.surname + "</option>")
        })
      }
    })
  }) // End on change


  $(".show_answer").on('click', function(event) {
    if( btn_show_answer ) {
      $('#answer').show("slow")
      btn_show_answer = false
    } else {
      $('#answer').hide(1000)
      btn_show_answer = true
    }
  })

  $('.btn_destroy_ticket').on('click', function(event) {
    $.ajax({
      url: 'tickets/' + $('#close_ticket_id').val()+ '/tickets/close_ticket/',
      type: 'POST',
      dataType: 'JSON',
      data: { detail: $('#close_message').val() },
      success: function (msg){
        if ( msg ) {
          process_tickets_table.ajax.reload(null,false)
          closed_tickets_table.ajax.reload(null,false)
          $('#modal_close_ticket').modal('hide')

          $('#label-process').text( parseInt($('#label-process').text()) - 1 )
          $('#label-closed').text( parseInt($('#label-closed').text()) + 1 )

          noty_alert('success', 'Ticket finalizado con éxito')
        } else {
          noty_alert('error', 'Ocurrio un error: no se pudo finalizar el ticket')
        }
      },
      error: function(msg){
        console.log('error ajax')
      }
    })
  })



  process_tickets_table = $('#process_tickets_table').DataTable({
                          'ajax':'tickets/get_tickets/2',
                          'responsive' : true,
                          'columns': [
                          {'data': 'date'},
                          {'data': 'type'},
                          {'data': 'client'},
                          {'data': 'assigned'},
                          {'data': 'title'},
                          {'data': 'actions'} ] })

    closed_tickets_table = $('#closed_tickets_table').DataTable({
                          'ajax':'tickets/get_tickets/3',
                          'responsive' : true,
                          'columns': [
                          {'data': 'date'},
                          {'data': 'type'},
                          {'data': 'client'},
                          {'data': 'assigned'},
                          {'data': 'title'},
                          {'data': 'actions'} ] })

    open_tickets_table = $('#open_tickets_table').DataTable({
                          'ajax':'tickets/get_tickets/1',
                          'responsive' : true,
                          'columns': [
                          {'data': 'date'},
                          {'data': 'type'},
                          {'data': 'client'},
                          {'data': 'assigned'},
                          {'data': 'title'},
                          {'data': 'actions'} ] })

}) // End JQuery
