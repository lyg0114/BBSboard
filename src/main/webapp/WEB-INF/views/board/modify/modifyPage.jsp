<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		$(".btn-modify").on("click",function(){
			formObj.attr("method","post");
			formObj.attr("action","/bbs/board/modifyPage");
			formObj.submit();
		});
				
		$(".btn-primary").on("click",function(){
			self.location="/bbs/board/listPage?page=${cri.page}&perPagenum=${cri.perPageNum}";
		});
		
	})
</script>
</head>
<body>
	<h1>Modify</h1>
	<form role="form" action="post" >
		<input type='hidden' name="bno" value="${boardVO.bno}">
		<input type='hidden' name="page" value="${cri.page}">
		<input type='hidden' name="perPageNum" value="${cri.perPageNum}">
		
		<table>
			<tr>
				<td><label>Bno</label></td>
				<td><input class="form-control" name='bno' value="${boardVO.bno}"  readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>Title</label></td>
				<td><input class="form-control" name='title' value="${boardVO.title}" ></td>
			</tr>
			<tr>
				<td><label>Text area</label></td>
				<td><textarea class="form-control" name='content'>${boardVO.content}</textarea></td>
			</tr>
			<tr>
				<td><label>Writer</label></td>
				<td><input class="form-control" name='writer' value="${boardVO.writer}"></td>
			</tr>
		</table>
	</form>
	<div class="box-footer">
		<button type="submit" class="btn btn-modify">SAVE</button>
		<button type="submit" class="btn btn-primary">CANCEL</button>
	</div>


</body>
</html>




