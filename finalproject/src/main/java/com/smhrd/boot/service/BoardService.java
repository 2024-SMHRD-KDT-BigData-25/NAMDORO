package com.smhrd.boot.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.boot.mapper.BoardMapper;
import com.smhrd.boot.model.board;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardService {
		
    private final BoardMapper boardMapper;
	
	public int addBoard(board b, MultipartFile file) throws IllegalStateException, IOException {
		
		//파일 이름 => 임의로 생성한 문자열(고유 => UUID) + 실제 선택한 파일이름
		String randomUUID = UUID.randomUUID().toString();
		int lastIndex = randomUUID.lastIndexOf("-");
		String lastPart = randomUUID.substring(lastIndex+1);
		
		String fileName = lastPart + file.getOriginalFilename();
		
		//파일 저장 => 경로 지정
		String filePath = "C://upload/"+fileName;
		file.transferTo(new File(filePath));
		
		b.setTB_IMG(fileName);
		
		return boardMapper.insertPost(b);
	}
    
	// 게시글 작성
    public int createPost(board post) {
        return boardMapper.insertPost(post);
    }
    
    //게시판 목록
    public List<board> getList() {
		return boardMapper.getList();

    	}
    }
