class AdminMailer < ActionMailer::Base
  default from: "atxhospitality@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.submission.subject
  #
  def submission(thing)
    @thing = thing

    to = ["chapambrose@gmail.com"]
    if @thing.kind_of?(Speaker) || @thing.kind_of?(BohconfSession)
      to += ["railsconf@austinonrails.org"]
    end

    mail to: to,
         subject: "Somebody Submitted a #{thing.class.to_s}"
  end
end
