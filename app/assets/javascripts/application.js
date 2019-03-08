// jquery.min



// require jquery3
//= jquery-migrate.min
//= template/jquery-ui.min
// template/popper.min
//= template/bootstrap.min
//= template/waves.min
//= template/jquery.slimscroll
//= template/modernizr
//= template/css-scrollbars.min

//= template/vertical-layout.min
//= template/pcoded.min

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
