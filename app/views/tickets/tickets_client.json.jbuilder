json.data @open_tickets do |t|
  json.id t.id
  json.user t.user
  json.date t.created_at.strftime("%d-%m-%Y")
  json.type t.ticket_type.name
  json.client t.client.name
  json.actions ''+
    if t.ticket_status.status != 'Finalizado'
               "<a href='tickets/#{t.id}' class='btn btn-sm btn-info'> <i class='fa fa-comment'></i></a> " +
               "<button class='btn btn-sm btn-success close_ticket_btn'"+
               "onclick='modal_close_ticket(#{t.id})'> <i class='fa fa-check'></i></button> "
    else
               "<a href='tickets/#{t.id}' class='btn btn-sm btn-primary'> Cerrado </a>"
    end
  json.title t.title
end