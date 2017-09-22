Rails.application.routes.draw do
  get '/lessons' => 'lessons#index'
  post '/lessons/submit_grades' => 'lessons#submit_grades'
  get '/lessons/new' => 'lessons#new'
end
