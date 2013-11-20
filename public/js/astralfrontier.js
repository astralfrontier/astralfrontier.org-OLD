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
});
