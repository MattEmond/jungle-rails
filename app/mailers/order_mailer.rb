class OrderMailer < ApplicationMailer

  default from: "no-reply@jungle.com"

  def order_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Order ID:#{@order.id}")
 end

end
