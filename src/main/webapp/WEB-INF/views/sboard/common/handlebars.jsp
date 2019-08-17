
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" ></script>
  
  <script id="templateNewAttach" type="text/x-handlebars-template">
  	<li>
	 <div class="img-container">
		<span><img src="{{imgsrc}}" alt="Attachment"></span>
		<div>
			<a href="{{getLink}}">{{fileName}}</a>
			<a href="{{fullName}}" class="delbtn AddNew"></a>
			<small data-src="{{fullName}}">X</small>
		</div>
	</div>	
	</li>
  </script>
  
  <!--  
  	imgsrc : img파일 경로 
  	getLink : 클릭시 다운로드
  	fullName : UUID를 통해 만들어진 해시값을 포함한 이름
  -->

