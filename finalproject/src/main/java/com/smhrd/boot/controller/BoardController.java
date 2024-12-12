package com.smhrd.boot.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.boot.mapper.BoardMapper;
import com.smhrd.boot.model.board;
import com.smhrd.boot.service.BoardService;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class BoardController {
	
    private final BoardService boardService;
	
	// 글 작성 페이지로 이동
    @GetMapping("/board/boardwrite")
    public String showWriteForm() {
        return "boardwrite";  // 글 작성 폼 페이지
    }
    
    @PostMapping("/board/write")
    public String createPost(board post, @RequestParam("photo") MultipartFile file) throws IllegalStateException, IOException {
//    	System.out.println("Test");
//    	System.out.println(file);
    	
//    	System.out.println(post.toString()); // 포스트 정보 출력
//        System.out.println(file.getOriginalFilename()); // 업로드된 파일 이름 출력

       // 글 작성 서비스 호출
        boardService.addBoard(post, file);

        return "redirect:/board";  // 목록 페이지로 리다이렉트
    }
    
    @GetMapping("/board")
    public String boardlist(Model model) {
    	List<board> boardList = boardService.getList();
    	
    	model.addAttribute("boardList", boardList);
    	
    	return "board";
    	
    }
    
    @GetMapping("board/{TB_NO}")
	public String detailForm(@PathVariable int TB_NO, Model model) throws IOException {

		board result = boardService.view(TB_NO);		
		model.addAttribute("board", result);

		return "boardview";
	}
    
 // 게시판 삭제 처리
    @GetMapping("/board/delete")
    public String delete(@RequestParam int TB_NO, Model model) throws IOException {
        System.out.println("게시글 삭제: " + TB_NO);

        // 게시글 삭제 서비스 호출
        int res = boardService.delete(TB_NO);

        // 삭제 결과 확인 후 리디렉션
        if (res > 0) {
            // 삭제 성공 시 게시판 목록 페이지로 리다이렉트
            return "redirect:/board";  // 목록 페이지로 리다이렉트
        } else {
            // 실패 시 메시지 표시 (예: 실패 메시지 화면으로)
            return "redirect:/board";  // 실패 시 게시판 목록 페이지로 리다이렉트
        }
    }
    


}
