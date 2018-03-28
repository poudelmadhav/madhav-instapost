class Notifications
    constructor: ->
        @notifications = $("[data-behavior='notifications']")
        @setup() if @notifications.length > 0 

    setup: ->
        $("[data-behavior='notifications-link']").on "click", @handleClick
        $.ajax(
          url: "/notifications.json"
          dataType: "JSON"
          method: "GET"
          success: @handleSuccess
        )

    handleClick: (e) =>
        $.ajax(
          url: "/notifications/mark_as_read"
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
          dataType: "JSON"
          method: "POST"
          success: ->
            $("[data-behavior='unread-count']").text(0)
        )

    handleSuccess: (data) =>
        items = $.map data, (notification) ->
            "<li><a class='dropdown-item' href='/users/#{notification.actor.id}'>#{notification.actor.name} #{notification.action}<a></li>"

        $("[data-behavior='unread-count']").text(items.length)
        $("[data-behavior='notification-items']").html(items)

jQuery ->
    new Notifications
