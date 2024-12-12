package com.smhrd.boot.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;
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

		// 파일 이름 => 임의로 생성한 문자열(고유 => UUID) + 실제 선택한 파일이름
		String randomUUID = UUID.randomUUID().toString();
		int lastIndex = randomUUID.lastIndexOf("-");
		String lastPart = randomUUID.substring(lastIndex + 1);

		String fileName = lastPart + file.getOriginalFilename();

		// 파일 저장 => 경로 지정
//		String filePath = "C://upload/" + fileName;
		String filePath = "C://Users/smhrd/git/NAMDORO/finalproject/src/main/webapp/upload/" + fileName;
//		String filePath = "upload/" + fileName;
		file.transferTo(new File(filePath));

		b.setTB_IMG(fileName);

		return boardMapper.insertPost(b);
	}

	// 게시글 작성
	public int createPost(board post) {
		return boardMapper.insertPost(post);
	}

	// 게시판 목록
	public List<board> getList() {
		return boardMapper.getList();

	}

	// 게시판 상세
	public board view(int TB_NO) throws IOException {
		board b = boardMapper.view(TB_NO);

		String content = b.getTB_CONTENT();
		b.setTB_CONTENT(content.replace("\n", "<br>"));

		byte[] imgBytes = Files.readAllBytes(Paths.get("C://Users/smhrd/git/NAMDORO/finalproject/src/main/webapp/upload/" + b.getTB_IMG()));

		// byte[] => Base64(인코더) =>String
		String base64Str = Base64.getEncoder().encodeToString(imgBytes);

		b.setTB_IMG(base64Str);

		return b;
	}

	public int delete(int TB_NO) {
		// 게시글 정보 가져오기
		board post = boardMapper.view(TB_NO);

		// 이미지 파일 경로
		String filePath = "C://Users/smhrd/git/NAMDORO/finalproject/src/main/webapp/upload/" + post.getTB_IMG();

		// 이미지 파일 삭제
		File file = new File(filePath);
		if (file.exists()) {
			file.delete();
		}

		// 게시글 삭제
		return boardMapper.delete(TB_NO);
	}

}
