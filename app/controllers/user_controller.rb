class UserController < ApplicationController
    
    def join
    end
    
    # 회원가입
    def join_process
        a = User.where(:email => params[:email]).take
        if a.nil?
            u = User.new
            u.email = params[:email]
            u.save
            redirect_to '/user/login'
        else
            redirect_to '/user/error1'
        end
    end
    
    def login
    end
    
    # 로그인
    def login_process
        u = User.where(:email => params[:email]).take
        unless u.nil?
            session[:user_id] = u.email
            redirect_to '/'
        else
            redirect_to '/user/error2'
        end
    end
    
    # 로그아웃
    def logout
        reset_session
        redirect_to '/'
    end
    
    # 내 정보
    def mypage
        @review = Review.where(:writer => session[:user_id]).reverse
    end
    
    def edit_path
        
    end
    
end
