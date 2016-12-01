class UserController < ApplicationController
    
    def join
    end
    
    # 회원가입
    def join_path
        a = User.where(:email => params[:email]).take
        if a.nil?
            u = User.new
            u.email = params[:email]
            u.save
            redirect_to '/user/login'
        else
            redirect_to '/user/join_error'
        end
    end
    
    def login
    end
    
    # 로그인
    def login_path
        u = User.where(:email => params[:email]).take
        unless u.nil?
            session[:user_id] = u.email
            redirect_to '/'
        else
            redirect_to '/user/login_error'
        end
    end
    
    # 로그아웃
    def logout
        reset_session
        redirect_to '/'
    end
    
    # 회원 정보 수정
    def edit
        @one_user = User.find(params[:id])
    end
    
    def edit_path
        @one_user = User.find(params[:id])
        a = User.where(:email => params[:email]).take
        if a.nil?
            @one_user.email = params[:email]
            @one_user.save
            redirect_to '/user/login'
        else
            redirect_to '/user/join_error'
        end
        
    end
    
    def data
        @user = User.all
    end
    
end
