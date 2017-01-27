class UserController < ApplicationController

    def join
    end

    # 회원가입
    def join_path
        a = User.where(:email => params[:email]).take
        @receiver = params[:email]

        if a.nil?
            u = User.new
            u.email = params[:email]
            u.confirmation = 'false'
            u.save

            ConfirmationMailer.confirmation_email(@receiver).deliver_later

            redirect_to '/user/welcome'
        else
            redirect_to '/user/join_error'
        end
    end

    def resend_confirmation_path
        a = User.where(:email => params[:email]).take
        @receiver = params[:email]

        if a.nil?
            redirect_to '/user/join'
        else
            ConfirmationMailer.confirmation_email(@receiver).deliver_later

            redirect_to '/user/welcome'
        end
    end

    def confirmation_path
        @users = User.all

        @users.each do |u|
            if u.email.split('.')[0] == params[:email]
                u.confirmation = 'true'
                u.save

                redirect_to '/user/login'
            else
            end
        end

        # redirect_to '/user/login_error'
    end

    def login
    end

    # 로그인
    def login_path
        u = User.where(:email => params[:email]).take
        unless u.nil?
            if u.confirmation=='true' || u.confirmation=='TRUE' || u.confirmation=='t'
                session[:user_id] = u.email
                redirect_to '/review/list'
            else
                redirect_to '/user/confirmation_error'
            end
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
        @one_review = Review.where(:writer => @one_user.email).all

        a = User.where(:email => params[:email]).take

        if a.nil?
            @one_review.each do |r|
                r.writer = params[:email]
                r.save
            end

            @one_user.email = params[:email]

            @one_user.save

            redirect_to '/user/login'
        else
            redirect_to '/user/join_error'
        end

    end

    def data
        @user = User.all
        @review = Review.all
        @address = Address.all
    end

end
