function checkImageType(fileName){
			var pattern = /jpg$|gif$|png$|jpeg$/i;
			
			return fileName.match(pattern);
}

function getFileInfo(fullName){
	var fileName,imgsrc,getLink;
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc = "/bbs/displayFile?fName="+encodeURI(encodeURIComponent(fullName));
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12);
		var end = fullName.substr(14);
		
		getLink = "/bbs/displayFile?fName="+encodeURI(encodeURIComponent(front+end));
		
	}else{
		imgsrc = "null"; //마땅한 사진이 아직 없음
		fileLink = fullName.substr(12);
		getLink = "/bbs/displayFile?fName="+encodeURI(encodeURIComponent(fullName));
	}
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return {
				fileName:fileName , 
				imgsrc:imgsrc,
				getLink:getLink,
				fullName:encodeURIComponent(fullName)
			};
}



