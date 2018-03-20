class Notifications
    constructor: ->
        @notifications = $("[data-behavior='notifications']")
        @setup() if @notifications.length > 0 

    setup: ->
        $.ajax(
            url: "/notifications.json"
            dataType: "JSON"
            method: "GET"
            success: @handleSuccess
        )

    handleSuccess: (data) =>
        console.log(data)
        items = $.map data, (notification) ->
            "<li><a class='dropdown-item' href='/users/#{notification.actor.id}'>#{notification.actor.name} #{notification.action}<a></li>"

        $("[data-behavior='unread-count']").text(items.length)
        $("[data-behavior='notification-items']").html(items)

jQuery ->
    new Notifications
