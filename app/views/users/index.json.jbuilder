# json.array! @users, partial: 'users/user', as: :user


json.data @users do |u|
  json.id u.id
  json.username u.username
  json.email u.email
  json.client_name u.person.client.name
  json.person_name u.person.name
  json.actions "<a data-toggle='modal' data-target='#modal-person' class='btn btn-info' data-remote='true'
                   href='/clients/#{u.id}/people/#{u.id}'><i class='fa fa-eye'></i></a>
                <a id='btn_person_edit' data-toggle='modal' data-target='#modal-person' class='btn btn-warning'
                   data-remote='true' href='/clients/#{u.id}/people/#{u.id}/edit'> <i class='fa fa-edit'></i> </a>
                <button type='button' class='btn btn-danger' onclick=modal_delete_user(#{u.id})> <i class='fa fa-trash'></i> </button>"

end