$(document).ready(function() {
  $('.form').hide();

  $('.form').eq(i).slideDown();
  $('.form').submit(function(e) {

  });


  $('.form').submit(function(e) {
    e.preventDefault();
    console.log(this.method);
  });

  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
