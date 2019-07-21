

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

	<div id='modDiv' style="display: none;">
		<input type='hidden' id='rno' />
		<div id="modal-replyer" class='modal-replyer'></div>
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
	
		
