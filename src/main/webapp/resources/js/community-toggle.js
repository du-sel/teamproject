
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
