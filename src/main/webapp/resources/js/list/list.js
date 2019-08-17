
	
	
		$(document).ready(function() {
			$("#newBtn").on("click", function() {
				self.location = "/bbs/sboard/register";
			});
			
			$("#searchBtn").on("click", function(event){
				
				self.location = "listPage?"//+'${pageMaker.makeQuery(1)}'
								+"&searchType="
								+$("select option:selected").val()
								+"&keyword="+encodeURI(encodeURIComponent($("#keywordInput").val()));
			});
			
			$("#logout").on("click",function(){
				self.location = "/bbs/user/logout";
			});
			
			
		});