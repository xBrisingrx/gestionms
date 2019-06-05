// jquery.min



//jquery3
//= require jquery-migrate.min
//= require template/jquery-ui.min
//= require template/popper.min
//= require template/bootstrap.min
//= require template/waves.min
//= require template/jquery.slimscroll
//= require template/modernizr
//= require template/css-scrollbars

//= require template/vertical-layout.min
//= require template/pcoded.min

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
