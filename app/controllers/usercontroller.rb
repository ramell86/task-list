class UserController < ApplicationController

    get '/signup' do
        if logged_in?

            redirect to "/lists"
        else

        erb :'user/signup'
        end
    end
  
    post '/signup' do
        
        @user = User.create(username: params[:user][:username], password_digest: params[:user][:username])
            session[:user_id] = @user.id
     redirect to '/lists'
    end
    get '/login' do
        if !logged_in?
            erb :"/user/login"
          else
            redirect to "/lists"
        end
    end
    post '/login' do    
        @user = User.find_by(:username =>[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
             redirect to "/lists"
             else
            redirect to '/login'
        end
    end

    get '/logout' do
        session.destroy

        erb :'/homepage'
        end
 end