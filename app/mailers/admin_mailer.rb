class AdminMailer < ActionMailer::Base
  default from: "atxhospitality@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.submission.subject
  #
  def submission(thing)
    @thing = thing

    mail to: "chapambrose@gmail.com",
         subject: "Somebody Submitted a #{thing.class.to_s}"
  end
end
