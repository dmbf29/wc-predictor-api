class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.knockout_stage.subject
  #
  def knockout_stage(user)
    @user = user

    mail(to: @user.email, subject: 'World Cup Predict - Knockout Round Fixtures')
  end
end
