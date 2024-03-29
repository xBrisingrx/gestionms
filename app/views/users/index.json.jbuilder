# json.array! @users, partial: 'users/user', as: :user


json.data @users do |u|
  json.id u.id
  json.username u.username
  json.email u.email
  json.client_name u.person.client.name
  json.person_name u.person.name
  json.actions "<a data-toggle='modal' data-target='#modal-user' class='btn btn-mini btn-info' data-remote='true'
                   href='/users/#{u.id}'><i class='fa fa-eye'></i></a>
                <a id='btn_user_edit' data-toggle='modal' data-target='#modal-person' class='btn btn-mini btn-warning'
                   data-remote='true' href='/users/#{u.id}/edit'> <i class='fa fa-edit'></i> </a>
                <button type='button' class='btn btn-mini btn-danger' onclick=modal_delete_user(#{u.id})> <i class='fa fa-trash'></i> </button>"

end