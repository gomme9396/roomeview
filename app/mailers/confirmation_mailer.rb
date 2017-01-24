class ConfirmationMailer < ApplicationMailer
    
    default from: 'roomeview@gmail.com'
    
    def confirmation_email(receiver)
        @receiver = receiver
        @url = 'roomeview.net/user/confirmation_path/' + @receiver
        mail(to: @receiver, subject: '루미뷰에 오신걸 환영합니다!!')
    end
    
end
