$(document).foundation();
$(document).ready(function() {
  $("#sidr-toggle").sidr({
    name: 'sidr-menu',
    side: 'right',
    body: 'nonexistent-element'
  });

  $(document).keydown(function(event) {
    console.log("event.which = " + event.which);
    if(event.which == 27) {
      console.log("got escape, hiding");
      $.sidr('close', 'sidr-menu');
    }
  });

  $('a', 'div[role=content]').each(function() {
     var a = new RegExp('/' + window.location.host + '/');
     if (!a.test(this.href)) {
        $(this).attr("target","_blank");
     }
  });
});
