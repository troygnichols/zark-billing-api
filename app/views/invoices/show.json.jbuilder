json.invoice do |json|
  json.extract! @invoice, :id, :entity_name, :client_name, :invoice_id, :issue_date, :due_date, :subject, :created_at, :updated_at, :notes, :paid_at

  json.items @invoice.items.map(&:attributes)
end
