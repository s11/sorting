// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
    $("#ujs").click(function(){
        alert("Called.............");
    })
})

$('#articles').sortable(
        {
          axis: 'y',
          dropOnEmpty:false,
          handle: '.handle',
          cursor: 'hand',
          items: 'li',
          opacity: 0.4,
          scroll: true,
          update: function(){
            $.ajax({
                type: 'post',
                data: $('#articles').sortable('serialize'), //+ '&id=<%#=@articles.id-%>',
                //data: $(this).attr('id'),
                dataType: 'script',
                complete: function(request){
                    $('#articles').effect('highlight');
                  },
                url: '/articles/sort'})
            }
          })
