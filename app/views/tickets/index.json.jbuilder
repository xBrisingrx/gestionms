json.data @open_tickets do |t|
  json.id t.id
  json.user t.user
  json.date t.created_at.strftime("%d-%m-%y")
  json.type t.ticket_type.letter
  json.client t.client.name
  if t.assigned
    json.assigned t.assigned.name
    json.actions ''+
        if t.ticket_status.status != 'Finalizado'
                   "<a href='tickets/#{t.id}' class='btn btn-mini btn-info'> <i class='fa fa-comment'></i></a> " +
                   "<button class='btn btn-mini btn-success close_ticket_btn'"+
                   "onclick='modal_close_ticket(#{t.id})'> <i class='fa fa-check'></i></button> " +
                   "<button class='btn btn-mini btn-warning asignar_ticket_btn'"+
                   "onclick='modal_asignar_ticket(#{t.id})'> <i class='fa fa-user'></i></button> "
        else
                   "<a href='tickets/#{t.id}' class='btn btn-mini btn-primary'> Cerrado </a>"
        end
  else
    json.assigned ''
    json.actions "<button class='btn btn-mini btn-success asignar_ticket_btn'"+
                   "onclick='modal_asignar_ticket(#{t.id})'> <i class='fa fa-user'></i></button> "
  end

  json.title t.title
end