json.array! @notifications do |notification| 
    # json.recipient notification.recipient 
    json.id notification.id
    json.actor notification.actor, :id, :name
    json.action notification.action 
    json.notifiable notification.notifiable
    json.created_ago distance_of_time_in_words(DateTime.now, notification.created_at)
end 
