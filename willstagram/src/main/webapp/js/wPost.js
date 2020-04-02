	//document ready
		$(function(){
			//post쓰기
			$(document).on('submit','#postWrite',function(e){
				var formData = new FormData();
				
				var paramArray = $(this).serializeArray();
				for (var i = 0; i < paramArray.length; i++) {
					formData.append(paramArray[i].name, paramArray[i].value);
				}  
				
				var inputFile = $("input[name='file1']");
				var files = inputFile[0].files;
				for (var i = 0; i < files.length; i++) {
					formData.append("uploadFile", files[i]);
				}
				
				
				$.ajax({
					url:'write_post',
					processData:false, //k:v 방식으로 전달
					contentType: false, //file전송을 위해서는 false로 줘야 한다.
					data:formData,
					type: "POST",
					dataType:'html',
					success: function(resultText){
							$('div.posts-section').prepend(resultText);
					}
					
				});
				
				 $(".post-popup.job_post").removeClass("active");
			     $(".wrapper").removeClass("overlay");
				
				e.preventDefault();
			});
			
			//post삭제
			$(document).on('click','ul.ed-options a.deletePost',function(e){
				var $post = $(e.target).parents('div.post-bar');
				var params = "pNo="+ $post.attr('post_no');
				$.ajax({
					url:'delete_post',
					method:'POST',
					data:params,
					dataType:'text',
					success: function(resultText){
						if(resultText.trim()=='success'){
							$post.remove();
						}else{
							alert('delete fail');
						}
					}
				});
				e.preventDefault();
			});
			
			//post숨기거나 보이기
			$(document).on('click','ul.ed-options a.hiddenPost',function(e){
				var $post = $(e.target).parents('div.post-bar');
				var params = "pNo="+ $post.attr('post_no') + "&status="+$(e.target).text();
				$.ajax({
					url:'status_change',
					method:'POST',
					data:params,
					dataType:'text',
					success: function(resultText){
						if(resultText.trim()=='success'){
							if( $(e.target).text()=='Hide'){
								$(e.target).text('Show');
							}else{
								$(e.target).text('Hide');
							}
							 
						}else{
							alert('change fail');
						}
					}
				});
				e.preventDefault();
			});
			
			//컨텐츠 보기 detail
			$(document).on('click','div.job_descp a',function(e){
				var $post = $(e.target).parents('div.post-bar');
				var params = "pNo="+ $post.attr('post_no');
				$.ajax({
					url:'get_post',
					method:'POST',
					data:params,
					dataType:'text',
					success: function(resultText){
						$('div.post_deatil').html(resultText);
						$('div.post_deatil').addClass("active");
						$(".wrapper").addClass("overlay");
					}
				});
				e.preventDefault();
			});
			
			$(document).on('click','button.btn-default',function(e){
				$('div.post_deatil').removeClass("active");
				$(".wrapper").removeClass("overlay");
				e.preventDefault();
			});
			
			//좋아유 추가
			$(document).on('click', 'ul.like-com a.like', function(e){
				var $post = $(e.target).parents('div.post-bar');
				var params = "pNo="+ $post.attr('post_no');
				$.ajax({
					url:'insert_like',
					data:params,
					type: "POST",
					dataType:'html',
					success: function(resultText){
						var likeCount = $(e.target).siblings('span.likeCount').text();
						if(resultText.trim()=='insert'){
							$(e.target).siblings('span.likeCount').text(Number(likeCount) + 1);
							$(e.target).addClass("active");
						} else if(resultText.trim()=='delete'){
							$(e.target).siblings('span.likeCount').text(Number(likeCount) - 1);
							$(e.target).removeClass("active");
						}
					}
					
				});
				e.preventDefault();
			});
			
			
		});