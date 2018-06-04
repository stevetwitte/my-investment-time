class ClearanceMailer < ApplicationMailer
  layout 'mailer'

  def change_password(user)
    @user = user
    mail(
        to: @user.email,
        subject: I18n.t(
            :change_password,
            scope: [:clearance, :models, :clearance_mailer]
        ),
        )
  end
end