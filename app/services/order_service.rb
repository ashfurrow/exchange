module OrderService
  def self.create!(user_id:, partner_id:, currency_code:, line_items: [])
    raise Errors::OrderError.new('Currency not supported') unless valid_currency_code?(currency_code)
    raise Errors::OrderError.new('Existing pending order') if create_params_has_pending_order?(user_id, line_items)
    Order.transaction do
      order = Order.create!(user_id: user_id, partner_id: partner_id, currency_code: currency_code)
      line_items.each { |li| LineItemService.create!(order, li) }
      order
    end
  end

  def self.submit(order, shipping_info:, credit_card_id:)
    # verify price change
    # hold price on credit card
    # status submitted
  end

  def self.user_pending_artwork_order(user_id, artwork_id, edition_set_id=nil)
    Order.pending.joins(:line_items).find_by(user_id: user_id, line_items: { artwork_id: artwork_id, edition_set_id: edition_set_id })
  end

  def self.create_params_has_pending_order?(user_id, line_items)
    line_items.map { |li| user_pending_artwork_order(user_id, li[:artwork_id], li[:edition_set_id]) }.any?
  end

  def self.valid_currency_code?(currency_code)
    currency_code == 'usd'
  end
end
