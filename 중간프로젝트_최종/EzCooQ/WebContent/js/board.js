/**
 * 
 * @returns
 */

$(document).ready(function(){
	
	$('#submitBtn').on('click',function(){
		
		$.ajax({
			url : '/InsertRecipe',	
			type : 'post',				
			dataType : 'json',
			success : function(res){
				send(res);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
		});
		
	});
	
	function send(res){
		var result = res.sw;
		if(result == 1){
			alert("글 등록 성공");
		} else if(result == 2){
			alert("글 등록 실패");
		}
	}
	
	
	var starRating = function(){
		  var $star = $(".star-input"),
		      $result = $star.find("output>b");
		  $(document)
		    .on("focusin", ".star-input>.input", function(){
		    $(this).addClass("focus");
		  })
		    .on("focusout", ".star-input>.input", function(){
		    
		    	var $this = $(this);
		    
		    	setTimeout(function(){
		      
		    		if($this.find(":focus").length === 0){
		    			$this.removeClass("focus");
		    		}
		    }, 1000);
		  })
		    .on("change", ".star-input :radio", function(){
		    $result.text($(this).next().text());
		  })
		    .on("mouseover", ".star-input label", function(){
		    $result.text($(this).text());
		  })
		    .on("mouseleave", ".star-input>.input", function(){
		    
		    	var $checked = $star.find(":checked");
		    
		    	if($checked.length === 0){
		    		$result.text("0");
		    	} else {
		    		$result.text($checked.next().text());
		    	}
		  });
		};
		starRating();
	
	
});