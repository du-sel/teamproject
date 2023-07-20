		$( document ).ready( function() {
			$( 'button.comment' ).click( function() {
			$( '.divcomment' ).slideToggle();
			} );
		} );
		
		$( document ).ready( function() {
			$( 'button.commentList' ).click( function() {
			$( '.ulcommentList' ).slideToggle();
			} );
		} );
		
		$( document ).ready( function() {
			$( 'button.insertpost' ).click( function() {
			$( '.submitpost' ).slideToggle();
			} );
		} );
			
		
		/* co-main.do, post.do textarea */
		const DEFAULT_HEIGHT = 31; // textarea 기본 height
	
	    let textarea = document.getElementById('co-textarea');
console.log(textarea);	    
	 	// Textarea 자동 높이 조절
	    textarea.oninput = (event) => {
	      let target = event.target;
	
	      target.style.height = 0;
	      if(target.scrollHeight >51){ //2줄일 때 높이
		      target.style.height = 7 + target.scrollHeight + 'px';  // 마지막 줄 아래 여백생기지 않음  	  
	      }else{
		      target.style.height = DEFAULT_HEIGHT + target.scrollHeight + 'px';  //2줄일 때 높이 유지  	      	  
	      }
	    };
	    
	    
	    function checkPhotoCount(){
	    	
console.log(length);
			if(length> maxlength){
				alert("파일 개수가 4개를 초과했습니다.");
			}else{
				if(confirm('포스트를 등록하시겠습니까?')){
					document.post.submit();				
				}
			}   	
	    }
	    
	    /*
	    var maxlength =4;
	    var length=0;*/
	    /* 사진 미리보기 */	
	    /*
	function imgPreview(event) {
		length=event.target.files.length;
		// 미리보기 초기화
	    	document.querySelector("div#thumb-preview").replaceChildren();
	    	
console.log(event.target.files.length);	    	
	    for (var image of event.target.files) {    	
	    		var reader = new FileReader();
	    		
	  	      reader.onload = function(event) {
	  	        var img = document.createElement("img");
	  	        img.style.width='200px';
	  	        img.setAttribute("src", event.target.result);
	  	        document.querySelector("div#thumb-preview").appendChild(img);
	  	      };
	  	
	  	      reader.readAsDataURL(image); 
	    	
	    }
	    
	  }
	  */
	  	var maxlength = 4;
		var length = 0;
		
		function imgPreview(event) {
		  
		 
		var uploadFile = event.target.files[0]; // Get the first selected file
		
		  
		
		if (uploadFile) {
		    length = event.target.files.length;
		
		    // Clear the preview area
		    document.querySelector("div#thumb-preview").replaceChildren();
		
		    
		
		for (var image of event.target.files) {
		      var reader = new FileReader();
		
		      reader.onload = function (event) {
		        var img = document.createElement("img");
		        img.style.width = '200px';
		        img.setAttribute("src", event.target.result);
		        document.querySelector("div#thumb-preview").appendChild(img);
		      };
		
		      reader.readAsDataURL(image);
		    }
		  }
		}
	  
	  
	  /* co-main.jsp에 있던 script 옮김 */    
	  
	  
	  /* <footer> 위에 있던 script 코드 */
	  $(document).ready(function() {
				    var contentHeight = $('.post-content-inner').height();
				    var lineHeight = parseFloat($('.post-content-inner').css('line-height'));
				    var maxHeight = 5 * lineHeight;
				    
				    if (contentHeight > maxHeight) {
				      $('.post-content-inner').addClass('collapsed');
				      $('.post-content-inner').css('max-height', maxHeight + 'px');
				      $('.post-content-inner').after('<span class="expand-button">더보기</span>');
				      
				      $('.expand-button').click(function() {
				        $('.post-content-inner').removeClass('collapsed');
				        $('.post-content-inner').css('max-height', 'none');
				        $(this).hide();
				      });
				    }
				  });
	  
	  
	   /* <footer> 아래에 있던 script 코드 */
	   $(document).ready(function() {
				    // 댓글 개수 이모티콘 클릭 이벤트
				    $(".comment-count").click(function() {
				      $(this).parent().siblings(".button-row").find(".comment-input").toggle();
				    });
				    // 좋아요 버튼 클릭 이벤트
				    $(".like-button").click(function() {
				      var likeCount = parseInt($(this).find(".like-count").text().trim());
				      likeCount++;
				      $(this).find(".like-count").text(likeCount);
				    });
				  });
				  
				  
				  
				  
				  
				  
				  
				  /* 댓글 input창 보여주기 */
				  function showCommentInput(elem) { 
						var sessionId = document.getElementById('sessionId').value;				  	 
console.log("sessionId 2"+sessionId);				  	 
					  	if(sessionId != null){ /* 세션에 id있다면 토글 */
					  	
					  		const commentInput = $(elem).closest("footer").find(".comment-input");
					    	commentInput.toggle();
					  	}else{ /* 세션에 id없다면 alert 로그인필요함 알림 */
					  		alert("댓글을 작성하려면 로그인이 필요합니다.");
					  		return false;
					  	}
				     
				  }
				  /* 댓글 추가 */
				  function addComment() {
				    const commentText = $("#comment-text").val();
				    if (commentText.trim() !== "") {
				    //  const commentItem = $("<li>").text(commentText);
				    //  $("#comment-list").append(commentItem);
				    //  $("#comment-text").val("");
				    // 댓글 개수 증가
				    const commentCount = $(".comment-count-number");
				    let count = parseInt(commentCount.text().trim());
				    count++;
				    commentCount.text(count);
				    $("#insertcomment").submit(); 
		
				    
					}
				  }
	  
	  			
	  			function checkDeletePost() {
	  				if(confirm('삭제하시겠습니까?')){
	  					document.getElementById('deletePost').submit();
	  				}else{
	  					return false;
	  				}
	  			}
	  			
	

	  