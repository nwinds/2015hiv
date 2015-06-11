class Notifier < ApplicationMailer
  default :form => 'developer <recommand@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order
    # @greeting = "Hi"

    mail to: order.email, :subject => "Store wishlist generated order reminder."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped
    @order = order
    @greeting = "Hi"

    mail to: order.email, :subject => "Store wishlist generated order shipped."
  end
end
