
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

