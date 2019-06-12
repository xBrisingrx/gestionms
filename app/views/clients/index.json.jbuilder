# json.array! @clients, partial: 'clients/client', as: :client

json.data @clients do |c|
  json.name c.name
  json.cuit c.cuit
  json.email c.email
  json.direction c.direction
  json.actions "
               <a class='btn btn-success ml-1 btn-sm' href='/clients/#{c.id}/people'>  <i class='fa fa-users' aria-hidden='true'></i> </a>
               <a class='btn btn-danger ml-1 btn-sm' href='/clients/#{c.id}/fleets'>  <i class='fa fa-desktop' aria-hidden='true'></i> </a>
                <a id='btn_client_edit' data-toggle='modal' data-target='#modal-client' class='btn btn-warning ml-1 btn-sm'
                     data-remote='true' href='/clients/#{c.id}/edit'><i class='fa fa-edit' aria-hidden='true'></i>
                </a>
                <a data-toggle='modal' data-target='#modal-client' class='btn btn-info ml-1 btn-sm' data-remote='true'
                     href='/clients/#{c.id}'><i class='fa fa-eye' aria-hidden='true'></i>\
                </a>
                <button id='btn-delete' name='btn-delete' type='button' class='btn btn-danger ml-1 btn-sm' data-toggle='modal'
                          onclick=modal_delete('#{c.id}') > <i class='fa fa-trash' aria-hidden='true'></i> 
                </button>
              </div>"
end


