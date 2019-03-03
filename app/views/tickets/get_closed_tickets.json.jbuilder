json.data @closed_tickes do |t|
  json.user t.user
  json.date t.created_at.strftime("%d-%m-%Y")
  json.type t.type_ticket
  json.client t.client.name
  json.assigned t.assigned.name
  json.title t.title
  json.actions " <a class='btn btn-info' href='tickets/#{t.id}'>Ver</a> " +
    if t.state_ticket != 'closed'
               "<button class='btn btn-success close_ticket_btn' data-id='#{t.id}'"+
               "data-toggle='modal' data-target='#modal_close_ticket'> <i class='fa fa-check'></i></button>"
    else
               "<button class='btn u-btn-indigo'> Cerrado </i></button>"
    end
end