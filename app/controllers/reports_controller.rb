class ReportsController < ApplicationController

	def index
		@title = 'Reportes'
	end

	def report_between_dates
		@tickets = Ticket.where( "created_at between ? AND ?", params[:start_date], params[:end_date] )
		@start_date = params[:start_date]
		@end_date = params[:end_date]

		respond_to do |format|
      format.xlsx {
      response.headers[
        'Content-Disposition'
      ] = "attachment; filename=tickets.xlsx" }
      format.json
	  end

	end

end