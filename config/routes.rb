Rails.application.routes.draw do
  get '/lessons' => 'lessons#index'
  post '/lessons/submit_grades' => 'lessons#submit_grades'
  get '/lessons/new' => 'lessons#new'
  get '/lessons/add' => 'lessons#add'
  post '/lessons/select' => 'lessons#select'
  get 'lessons/delete' => 'lessons#delete'
  post '/lessons/remove' => 'lessons#remove'
  #root '/'
end
