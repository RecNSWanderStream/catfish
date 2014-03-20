$(document).ready(function() {
    $('.hidden-data').hide()

    $('.show-more').click(function() {
	$(this).parent().parent().next('.hidden-row').find('.hidden-data').slideToggle("slow");
    });
});
