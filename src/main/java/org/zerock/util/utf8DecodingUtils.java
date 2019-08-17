package org.zerock.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.zerock.controller.SearchBoardController;
import org.zerock.domain.BoardVO;

@Service
public class utf8DecodingUtils {
	private static final Logger logger = LoggerFactory.getLogger(utf8DecodingUtils.class);
	
	private String[] files;
	private String AfterDecodingFileName;
	
	public BoardVO DecodingFileName(BoardVO board)
	{
		files = board.getFiles();
		
		if(files.length > 0 ) {
			try {
				for(int i=0 ;i<files.length;i++)
				{
					AfterDecodingFileName = URLDecoder.decode(files[i], "UTF-8");
					files[i]=AfterDecodingFileName;
				}
				board.setFiles(files);
			}catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
		}
		
		return board;
		
	}
}
