Rails.application.routes.draw do

  #Login Routes

  get '/register' => 'logins#index'

  get '/login' => 'logins#new'

  post '/login' => 'logins#create'

  post '/logins/:id' => 'logins#destroy'

  #Borrower Routes

  get '/borrowers/:id' => 'borrowers#show'

  post '/borrowers' => 'borrowers#create'

  #Lender Routes

  get '/lenders/:id' => 'lenders#show'

  post '/lenders' => 'lenders#create'

  #Transaction Routes

  post '/transactions' => 'transactions#create'

  # Welcome Pages

  root 'welcome#index'

  get '/charities' => 'welcome#charities'

  get '/benefactors' => 'welcome#benefactors'
end
