//= require rails-ujs
//= require template/jquery.min
//= require template/jquery-migrate.min
//= require template/popper.min
//= require template/bootstrap.min
//= require template/jquery.cookie

// JS Plugins init
//= require template/appear
//= require template/bootstrap-select/bootstrap-select.min
//= require template/bootstrap-select/defaults-es_ES
//= require template/noty.min
//= require template/jquery.mCustomScrollbar.concat.min
//= require template/datatables/jquery.dataTables.min
//= require template/datatables/dataTables.select


// JS Unify
//= require template/hs.core
//= require template/hs.side-nav
//= require template/hs.hamburgers
//= require template/hs.dropdown
//= require template/hs.scrollbar
//= require template/hs.focus-state
//= require template/datatables/hs.datatables

//= require template/noty.min
//= require jquery-validate/jquery.validate.min
//= require jquery-validate/additional-methods.min
//= require jquery-validate/messages_es_AR.min
//= require activestorage
//= require_tree .



$(document).on('ready', function () {
  // initialization of custom select
  $('.js-select').selectpicker();

  // initialization of sidebar navigation component
  $.HSCore.components.HSSideNav.init('.js-side-nav');

  // initialization of hamburger
  $.HSCore.helpers.HSHamburgers.init('.hamburger');

  // initialization of HSDropdown component
  $.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
    dropdownHideOnScroll: false,
    dropdownType: 'css-animation',
    dropdownAnimationIn: 'fadeIn',
    dropdownAnimationOut: 'fadeOut'
  });

  // initialization of custom scrollbar
  $.HSCore.components.HSScrollBar.init($('.js-custom-scroll'));

  // initialization of editable table
  $('.js-editable-table tr').editable({
    keyboard: true,
    dblclick: true,
    button: true,
    buttonSelector: '.js-edit',
    maintainWidth: true,
    edit: function (values) {
      $('.js-edit i', this).removeClass('hs-admin-pencil').addClass('hs-admin-check g-color-secondary');
    },
    save: function (values) {
      $('.js-edit i', this).removeClass('hs-admin-check g-color-secondary').addClass('hs-admin-pencil');
    }
  });

  // initialization of datatables
  $.HSCore.components.HSDatatables.init('.js-datatable');
});