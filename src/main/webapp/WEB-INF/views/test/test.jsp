<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

</head>
<body>
	<h2>Ajax Test Page</h2>
	<div>
		<div>
			REPLYER <input type='text' name='replyer' id='newReplyWriter'>
		</div>
		<div>
			REPLY TEXT <input type='text' name='replytext' id='newReplyText'>
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	
	<ul id="replies"></ul>
	<ul class='pagination'></ul>
</body>

	<div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext' />
		</div>
		<div>
			<button id="replyModBtn">Modify</button>
			<button id="replyDelBtn">DELETE</button>
			<button id="closeBtn">Close</button>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-2.1.4.min.js"
	integrity="sha256-8WqyJLuWKRBVhxXIL1jBDD7SDxU936oZkCnxQbWwJVw="
	crossorigin="anonymous"></script>
	<script src="/bbs/resources/js/reply.js"></script>
	<link href="/bbs/resources/css/reply.css" rel="stylesheet">	
</html>