var bno = 22;
var replyPage = 1;
	//getAllList();
	getPageList(replyPage);
	
	function getAllList() { //전체 리스트 출력
		$.getJSON("/bbs/replies/all/" + bno, function(data) {

			var str = "";
			$(data).each(function() {
				str += "<li data-rno='"+this.rno+"' class='replyLi'>"
						+ this.rno + " : " + this.replytext
						+ "<button>MOD</button></li>";
					});
			$("#replies").html(str);
		});
	}
	
	//몇번째 page로 이동할 것인가
	function getPageList(page){
		$.getJSON("/bbs/replies/"+bno+"/"+page,function(data){
			console.log(data.list.length);
			
			var str="";
			
			$(data.list).each(function(){
				str += "<li data-rno='"+this.rno+"' class='replyLi'>"
					+this.rno+":"+this.replytext+"<button>MOD</button></li>";
			});
			$("#replies").html(str);
			printPaging(data.pageMaker);
			
			});
		
	}
	/*댓글 페이징 처리###############################################################*/
	function printPaging(pageMaker){
		var str="";
		
		if(pageMaker.prev){
			str += "<li class='paginate_button'><a href='"+(pageMaker.startPage-1)+"' << </a></li>" ;
		}
		
		for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
			var strClass ="class='paginate_button'"+pageMaker.cri.page == i?' active':'';
			str += "<li class='paginate_button'><a href='"+i+"'>"+i+"</a></li>";
			//str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
		
		if(pageMaker.next){
			str += "<li class='paginate_button'><a href='"+(pageMaker.endPage+1)+"' >> </a></li>" ;
		}
		$('.pagination').html(str);
	}
	
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		relyPage = $(this).attr("href");
		console.log("relyPage : "+relyPage);
		getPageList(relyPage);
		
	});	
	/*댓글 페이징 처리###############################################################*/
	
	

	$("#replies").on("click",".replyLi button", function(){ //모달창 등장
		
		var reply = $(this).parent();
		var rno = reply.attr("data-rno");
		var replytext = reply.text();
		
		$(".modal-title").html(rno);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");
	});
	
	$("#closeBtn").on("click",function(){
		$("#modDiv").hide("slow");
	});
	
	$("#replyAddBtn").on("click", function() { //추가
		var replyer = $("#newReplyWriter").val();
		var replytext = $("#newReplyText").val();
		

		$.ajax({
			type : 'post',
			url : '/bbs/replies',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST",
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				replyer : replyer,
				replytext : replytext
			}),
			success : function(result) {
				if (result == 'success') {
					alert("Add Complete");
					getPageList(replyPage);
				}
			}
		});
	});
	
	
	$("#replyDelBtn").on("click", function() { //삭제
		console.log("testestst");
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		console.log(rno);
		console.log(replytext);

		$.ajax({
			type : 'delete',
			url : '/bbs/replies/'+rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE",
			},
			dataType : 'text',
			success : function(result) {
				if (result == 'success') {
					alert("Remove Complete");
					$("#modDiv").hide("slow");
					getPageList(replyPage);
				}
			}
		});
	});
	
	$("#replyModBtn").on("click", function() { //수정 modify
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : 'put',
			url : '/bbs/replies/'+rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT",
			},
			dataType : 'text',
			data : JSON.stringify({
				replytext : replytext
			}),
			success : function(result) {
				if (result == 'success') {
					alert("Modify Complete");
					$("#modDiv").hide("slow");
					getPageList(relyPage);
				}
			}
		});
	});
	
	
	
	
	
	