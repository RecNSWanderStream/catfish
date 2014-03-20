$('td .field_more').click(function(){
   $(this).find('span').text(function(_, value){return value=='-'?'+':'-'});
    $(this).nextUntil('tr.field').slideToggle(100, function(){
   });
});