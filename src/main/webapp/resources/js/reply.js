

var bno = $("#bno").val();
console.log(bno);
var replyPage = 1;
var $loginID =$("#loginID").val();

getPageList(replyPage,$loginID);
	
	//페이징 처리된 댓글 리스트
	function getPageList(page,$loginID){
		console.log("getPageListTest");
		$.getJSON("/bbs/replies/"+bno+"/"+page,function(data){
			
			var str="<table>";
			
			$(data.list).each(function(){
				if($loginID == this.replyer){
					str += "<tr data-rno='"+this.rno+"' class='replyLi'>" 
					+"<td><span id='Replywho'>"+this.replyer+"</span>"+" : </td>"
					+"<td><span id='Retext'>"+this.replytext+"</span></td>"
					+"<td><button class='btn btn-success btn-circle btn-sm'>MOD</button></td>"
					+"</tr>";
				}else{
					str += "<tr data-rno='"+this.rno+"' class='replyLi'>" 
					+"<td><span id='Replywho'>"+this.replyer+"</span>"+" : </td>"
					+"<td><span id='Retext'>"+this.replytext+"</span></td>"
					+"</tr>";
				}
				
				
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
		getPageList(relyPage,$loginID);
		
	});	
	/*댓글 페이징 처리###############################################################*/
	
	

	$("#replies").on("click",".replyLi button", function(){ //모달창 등장
		
		var reply = $(this).parent();
		var rno = reply.attr("data-rno");
		
		var replytext = $("#Retext").html();
		var Replywho = $("#Replywho").html();
				
		$("#modal-replyer").html(Replywho);
		
		$("#rno").val(rno);
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
					getPageList(replyPage,$loginID);
					$("#newReplyText").val("");
				}
			}
		});
	});
	
	
	$("#replyDelBtn").on("click", function() { //삭제
		alert("test");
		
		var rno = $("#rno").val();
		var replytext = $("#replytext").val();
		console.log(rno);
		console.log(replytext);

		$.ajax({
			type : 'DELETE',
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
					getPageList(replyPage,$loginID);
				}
			}
		});
	});
	
	$("#replyModBtn").on("click", function() { //수정 modify
		var rno = $("#rno").val();
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
					getPageList(replyPage,$loginID);
				}
			}
		});
	});
	
	
	
	
	
	