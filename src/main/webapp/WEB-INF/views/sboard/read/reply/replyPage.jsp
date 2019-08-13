
	<input type='hidden' id='loginID' value="${login.uid}">
	
	<div class="replyData">
		<div class="replyer">
			${login.uid}
			<input type='hidden' name='replyer' id='newReplyWriter' value="${login.uid}">
		</div>
		<div class="reply-text">
			 <input placeholder="Please Input reply Message..."class="form-control form-control-user" type='text' name='replytext' id='newReplyText'>
		</div>
		<button class="btn btn-success"id="replyAddBtn">ADDREPLY</button>
	</div>
	
	
	<ul id="replies"></ul> 
	<ul class='pagination'></ul>

	<div id='modDiv' style="display: none;">
		<input type='hidden' id='rno' />
		<div id="modal-replyer" class='modal-replyer'></div>
		<div>
			<input type='text' id='replytext' />
		</div>
		
		<div id="button-group">
			<button id="replyModBtn">Modify</button>
			<button id="replyDelBtn">DELETE</button>
			<button id="closeBtn">Close</button>
		</div>
	</div>
 	
 	<script src="/bbs/resources/js/read/reply.js"></script>
	<link href="/bbs/resources/css/reply.css" rel="stylesheet">
		
