class UserMailer < ActionMailer::Base
  default from: "railsconf@austinonrails.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.bohconf_session_submitted.subject
  #
  def bohconf_session_submitted(session)
    @session = session

    mail to: session.host_email,
         subject: "Your BohConf Session Submission"
  end
end
