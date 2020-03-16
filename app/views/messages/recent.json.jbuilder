
json.array!(@messages) do |message|
    json.id message.id
    json.message message.message
    json.sender do
      json.id message.sender.id
      json.email message.sender.email
    end
    json.receiver do
      json.id message.receiver.id
      json.email message.receiver.email
    end
    # In real site, this would be in a constants file
    json.created_at message.created_at.strftime("%Y-%m-%d %l:%m%P")
    json.updated_at message.updated_at.strftime("%Y-%m-%d %l:%m%P")
end