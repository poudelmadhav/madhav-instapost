[1mdiff --git a/app/views/posts/index.html.erb b/app/views/posts/index.html.erb[m
[1mindex 97ea7cd..7695c21 100644[m
[1m--- a/app/views/posts/index.html.erb[m
[1m+++ b/app/views/posts/index.html.erb[m
[36m@@ -4,8 +4,6 @@[m
 	</div><!-- my posts id -->[m
 [m
 	<div class = "text-center" id="infinite-scrolling">[m
[31m-	 	<% unless @posts.total_pages < 2 %>[m
[31m-			<%= link_to 'Show More Posts', posts_path(:page => 2), :remote => true, :id => 'show_more_link', :class => 'btn btn-default btn-lg btn-block' %>[m
[31m-		<% end %>[m
[32m+[m	[41m [m	[32m<%= will_paginate @posts %>[m
 	</div>[m
 </div>[m
[1mdiff --git a/app/views/posts/index.js.erb b/app/views/posts/index.js.erb[m
[1mindex 0c0e64b..3ca263d 100644[m
[1m--- a/app/views/posts/index.js.erb[m
[1m+++ b/app/views/posts/index.js.erb[m
[36m@@ -1,18 +1,8 @@[m
 // for infinite load[m
[31m-// $('#my-posts').append('<%= j render @posts %>');[m
[31m-// <% if @posts.next_page %>[m
[31m-//   $('.pagination').replaceWith('<%= j will_paginate @posts %>');[m
[31m-// <% else %>[m
[31m-//   $(window).off('scroll');[m
[31m-//   $('.pagination').remove();[m
[31m-// <% end %>[m
[31m-[m
[31m-// show more button[m
[31m-$("#my-posts").append("<%= j render @posts %>");[m
[31m-[m
[31m-// Hide link if it is last page otherwise update link[m
[31m-<% if @posts.total_pages == @posts.current_page %>[m
[31m-    $("#show_more_link").hide();[m
[32m+[m[32m$('#my-posts').append('<%= j render @posts %>');[m
[32m+[m[32m<% if @posts.next_page %>[m
[32m+[m[32m  $('.pagination').replaceWith('<%= j will_paginate @posts %>');[m
 <% else %>[m
[31m-    $("#show_more_link").attr("href", "<%= posts_path(:page => (@posts.current_page + 1)) %>");[m
[32m+[m[32m  $(window).off('scroll');[m
[32m+[m[32m  $('.pagination').remove();[m
 <% end %>[m
