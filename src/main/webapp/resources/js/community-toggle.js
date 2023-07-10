
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
	    	var preview = document.querySelector("#thumbnail").length;
console.log(preview);	    	
	    }
	    
	    
	    /* 사진 미리보기 */	
	function imgPreview(event) {
		
		// 미리보기 초기화
	    	document.querySelector("div#thumb-preview").replaceChildren();
	    	var maxlength =4;
console.log(event.target.files.length);	    	
	    for (var image of event.target.files) {
	    	if(event.target.files.length>maxlength){
	    		document.querySelector("div#thumb-preview").insertAdjacentHTML("afterend", "<p>파일 개수가 4개를 초과했습니다.</p>");
	    	}else{
	    		var image = event.target.files[i];
    	
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
	  }
