class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self } }

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to [company, "quotes"] }
  # after_destroy_commit -> { broadcast_remove_to [company, "quotes"] }

  # after_create_commit do
  #   broadcast_prepend_to(
  #     [company, "quotes"],
  #     partial: "quotes/quote",
  #     locals: { quote: self },
  #     target: "quotes"
  #   )

  #   if company.quotes.count == 1
  #     broadcast_update_to(
  #       [company, "quotes"],
  #       target: Quote.new,
  #       html: ""
  #     )
  #   end
  # end

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
