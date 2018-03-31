json.array! @recent_notifications do |notification| 
    # json.recipient notification.recipient 
    json.id notification.id
    json.unread !notification.read_at?
	json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]
    # json.actor notification.actor, :id, :name
    # json.action notification.action 
    # json.notifiable notification.notifiable
    # json.created_ago distance_of_time_in_words(DateTime.now, notification.created_at)
end 
