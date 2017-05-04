class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_post.subject
  #
  def sendmail_post(post)
    @post = post

    mail to: "y-imaida@ce.em-net.ne.jp",
         subject: '【Istangram】写真が投稿されました'
  end
end
