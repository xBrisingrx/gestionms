//= require jquery3
//= require admindesk/jquery-ui.min
//= require admindesk/popper.min
//= require admindesk/bootstrap.min
//= require admindesk/waves.min
//= require admindesk/jquery.slimscroll

//= require admindesk/pcoded.min
//= require admindesk/horizontal-layout.min
//= require admindesk/select2.full.min
//= require admindesk/select2-custom
//= require admindesk/script

//= require dataTables/datatables.min

//= require jquery-validate/jquery.validate.min
//= require jquery-validate/additional-methods.min
//= require jquery-validate/messages_es_AR.min




//= require rails-ujs
//= require activestorage

//= require clients
//= require fleets
//= require noty.min
//= require people
//= require tickets
//= require users



// require_tree .

function noty_alert( type, msg, time)
{
  if (typeof time == 'undefined') {
    time = 2000
  }
  new Noty({
      theme: 'bootstrap-v4',
          type: type,
      layout: 'topRight',
      text: msg,
      timeout: (true, time)
  }).show();
}
