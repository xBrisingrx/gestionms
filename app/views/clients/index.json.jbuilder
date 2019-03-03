# json.array! @clients, partial: 'clients/client', as: :client

json.data @clients do |c|
  json.name c.name
  json.cuit c.cuit
  json.email c.email
  json.direction c.direction
  json.actions " <div class='btn-group' role='group'>
            <button id='btn-employee' type='button' class='btn btn-secondary dropdown-toggle' data-toggle='dropdown'
                aria-haspopup='true' aria-expanded='false'>
              <i class='fa fa-users' aria-hidden='true'></i>
            </button>
            <div class='dropdown-menu' aria-labelledby='btn-employee' >
              <a class='dropdown-item' href='/clients/#{c.id}/people'>  Ver </a>
                <a data-toggle='modal' data-target='#modal-client' class='dropdown-item' data-remote='true'
                   href='/clients/#{c.id}/people/new'>Agregar</a>
            </div>
            <div class='btn-group' role='group'>
            <button id='btn-computers' type='button' class='btn btn-secondary dropdown-toggle' data-toggle='dropdown'
                aria-haspopup='true' aria-expanded='false'>
              <i class='fa fa-desktop' aria-hidden='true'></i>
            </button>
            <div class='dropdown-menu' aria-labelledby='btn-computers' >
              <a class='dropdown-item' href='/clients/#{c.id}/fleets'>  Ver </a>
                <a data-toggle='modal' data-target='#modal-client' class='dropdown-item' data-remote='true'
                   href='/clients/#{c.id}/fleets/new'>Agregar</a>
            </div>
            <a data-toggle='modal' data-target='#modal-client' class='btn btn-info' data-remote='true'
                   href='/clients/#{c.id}'>Show</a>
                <a id='btn_client_edit' data-toggle='modal' data-target='#modal-client' class='btn btn-warning'
                   data-remote='true' href='/clients/#{c.id}/edit'><i class='fa fa-edit' aria-hidden='true'></i></a>
            <a data-toggle='modal' data-target='#modal-client' class='btn btn-info' data-remote='true'
                   href='/clients/#{c.id}'><i class='fa fa-eye' aria-hidden='true'></i></a>
                <button id='btn-delete' name='btn-delete' type='button' class='btn btn-danger' data-toggle='modal'
                        onclick=modal_delete('#{c.id}') > <i class='fa fa-trash' aria-hidden='true'></i> </button>
          </div> "
end


