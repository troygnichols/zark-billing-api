json.invoices do |json|
  json.array!(@invoices) do |invoice|

    json.extract! invoice, :id, :entity_name, :client_name, :invoice_id, :issue_date, :due_date, :subject, :notes, :paid_at
    json.url invoice_url(invoice, format: :json)

    json.items invoice.items.map(&:attributes)
  end
end
