Rails.application.routes.draw do
  devise_for :users
  get '/lessons' => 'lessons#index'
  post '/lessons/submit_grades' => 'lessons#submit_grades'
  get '/lessons/grades' => 'lessons#grades'
  get '/lessons/add' => 'lessons#add'
  post '/lessons/select' => 'lessons#select'
  get 'lessons/delete' => 'lessons#delete'
  post '/lessons/remove' => 'lessons#remove'
  get 'lessons/semesters' => 'lessons#semesters'
  get 'lessons/semesters/:id' => 'lessons#show_semester'
  get 'lessons/stats' => 'lessons#stats'
  get 'lessons/status' => 'lessons#status'
  get '/about' => 'main#about'
  root 'main#index'
end
