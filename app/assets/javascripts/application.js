//= require jquery3
// admindesk/jquery-ui.min
// admindesk/popper.min
// admindesk/bootstrap.min
// admindesk/waves.min
// admindesk/jquery.slimscroll

// admindesk/pcoded.min
// admindesk/horizontal-layout.min
// admindesk/script

//= require jquery-validate/jquery.validate.min
//= require jquery-validate/additional-methods.min
//= require jquery-validate/messages_es_AR.min

//= require rails-ujs
//= require activestorage

// clients
// fleets
// noty.min
// people
// tickets
// users



//= require_tree .

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
