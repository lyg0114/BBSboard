<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var result = '${msg}';
	if(result === 'success')
	{
		alert("Complete.");
	}
	
	$(document).ready(function(){
		$(".btn-NewRegister").on("click",function(){
			self.location="/bbs/board/register";
		});
	})
		
	
	
	
</script>
</head>
<body>
	<h1>listAll</h1>

	<table>
		<tr>
			<th>BNO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>REGDATE</th>
			<th>VIEWCNT</th>
		</tr>
	<c:forEach items="${list}" var="boardVO">
		<tr>
			<td>${boardVO.bno}</td>
			<td><a href='/bbs/board/read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
			<td><span>${boardVO.viewcnt}</span></td>
		</tr>
	
	</c:forEach>	

	</table>
	<button type="submit" class="btn btn-NewRegister">NEWREGISTER</button>


</body>
</html>


