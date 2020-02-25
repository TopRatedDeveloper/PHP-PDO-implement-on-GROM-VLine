$(document).ready(function(){
    $.ajax({url: "./backend/includes/load.php", success: function(result){
        var count = 0;
        result = JSON.parse(result);
        
        if (result == '0'){
            $('#review-all').append('<dl style="font-size: 13px;"><dt><span class="summary-review">No summary reviews&nbsp</span><span>Review by&nbsp</span><span class="customer-name">No there...&nbsp</span></dt><dd><table class="ratings-table"><colgroup><col width="1"><col></colgroup><tbody><tr><th>Satisfaction</th><td><div class="rating-box"><div class="rating" style="width:0%;"></div></div></td></tr></tbody></table>No reviews&nbsp<medium class="date">(Posted on No date)</medium></dd></dl>');
        }else{
            var count = result.length;
            $('#review h2 span').html(count);
            for (var i=0; i<count; i++) {
                $('#review-all').append('<dl style="font-size: 13px;"><dt><span class="summary-review">'+result[i].msg_txt+'&nbsp</span><span>Review by&nbsp</span><span class="customer-name">'+result[i].cust_nm+'&nbsp</span></dt><dd><table class="ratings-table"><colgroup><col width="1"><col></colgroup><tbody><tr><th>Satisfaction</th><td><div class="rating-box"><div class="rating" style="width:100%;"></div></div></td></tr></tbody></table>'+result[i].cmnt_txt+'&nbsp<medium class="date">(Posted on '+result[i].post_dt+')</medium></dd></dl>');
            }
        }
        var prd_name = $('.title_h1').text();
        $('.product-name').html(prd_name);
    }});

    $('#submit_review').on('click', function(){
        var nickname_field = $("#nickname_field").val();
        var summary_field = $("#summary_field").val();
        var review_field = $("#review_field").val();
        var satisfaction_1 = $("#satisfaction_1").val();
        $.post("./backend/includes/post.php",
        {
            cutname:nickname_field,
            summary:summary_field,
            review:review_field,
            satisfication:satisfaction_1,
        },
        function(response,status){ // Required Callback Function
            console.log("*----Received Data----*nnResponse : " + response+"nnStatus : " + status);
        });
    });
    
});	