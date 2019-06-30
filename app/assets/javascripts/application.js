//= require jquery3




//= require jquery-validate/jquery.validate.min
//= require jquery-validate/additional-methods.min
//= require jquery-validate/messages_es_AR.min

//= require rails-ujs
//= require activestorage
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
