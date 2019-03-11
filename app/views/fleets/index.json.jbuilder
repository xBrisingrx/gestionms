json.data @fleets do |f|
  json.id f.id
  json.client_id f.client
  json.code f.code
  json.os f.os
  json.ip_address f.ip_address
  json.hardware f.hardware
  json.software f.software
  json.model f.model
  json.person f.person.name
  json.actions "<a data-toggle='modal' data-target='#modal-fleet' class='btn btn-info' data-remote='true'
                   href='/clients/#{f.client_id}/fleets/#{f.id}'><i class='fa fa-eye'></i></a>
                <a id='btn_fleet_edit' data-toggle='modal' data-target='#modal-fleet' class='btn btn-warning'
                   data-remote='true' href='/clients/#{f.client_id}/fleets/#{f.id}/edit'> <i class='fa fa-edit'></i> </a>
                <button type='button' class='btn btn-danger' onclick=modal_delete_fleet(#{f.id},#{f.client_id})> <i class='fa fa-trash'></i> </button>"

end
