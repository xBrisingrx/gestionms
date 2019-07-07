jQuery(document).ready(function($) {

	// $('#form-report-between-dates').submit(function( e ){
		// e.preventDefault()
		// noty_alert('success', 'send')
		// $.ajax({
		// 	url: "report_between_dates",
		// 	type: 'POST',
		// 	data: { start_date: $('#start_date').val() },
		// 	success: function( resp ){
		// 		noty_alert('success', 'Success')
		// 	},
		// 	error: function(){
		// 		noty_alert('error', 'no')
		// 	}
		// })
	// })

	$('.report_between_dates').on('click', function(e){
		$.ajax({
			url: "report_between_dates/"+ $('#start_date').val() + '/' + $('#end_date').val(),
			type: 'GET',
			contentType: 'application/xls; charset=UTF-8',

			xhrFields: { responseType: 'blob' },
			success: function( data ){
				noty_alert('success', 'Success ')
				var a = document.createElement('a');
        var url = window.URL.createObjectURL(data);
        a.href = url;
        a.download = 'tickets.xlsx';
        document.body.append(a);
        a.click();
        a.remove();
        window.URL.revokeObjectURL(url);
			},
			error: function(){
				noty_alert('error', 'no')
			}
		})
	})

})