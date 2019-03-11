json.data @people do |p|
	json.id p.id
	json.name p.name
	json.surname p.surname
	json.dni p.dni
	json.email p.email
	json.phone p.phone
	json.actions "<a data-toggle='modal' data-target='#modal-person' class='btn btn-sm btn-info' data-remote='true'
									 href='/clients/#{p.client_id}/people/#{p.id}' title='Ver información'><i class='fa fa-eye'></i></a>
								<a id='btn_person_edit' data-toggle='modal' data-target='#modal-person' class='btn btn-sm btn-warning'
									 data-remote='true' href='/clients/#{p.client_id}/people/#{p.id}/edit' title='Editar'> <i class='fa fa-edit'></i> </a>
								<button type='button' class='btn btn-sm btn-danger' onclick=modal_delete_person(#{p.id},#{p.client_id}) title='Eliminar'> 
									<i class='fa fa-trash'></i> </button>"

end


