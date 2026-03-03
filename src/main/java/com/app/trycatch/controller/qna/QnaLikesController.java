package com.app.trycatch.controller.qna;

import com.app.trycatch.dto.member.CorpMemberDTO;
import com.app.trycatch.dto.member.IndividualMemberDTO;
import com.app.trycatch.dto.member.MemberDTO;
import com.app.trycatch.service.qna.QnaLikesService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/qna/likes")
@RequiredArgsConstructor
@Slf4j
public class QnaLikesController {
    private final QnaLikesService qnaLikesService;
    private final HttpSession session;

    @PostMapping("/toggle")
    public ResponseEntity<Void> toggle(@RequestParam Long qnaId) {
        Object member = session.getAttribute("member");
        Long memberId = null;
        if (member instanceof MemberDTO dto) memberId = dto.getId();
        else if (member instanceof IndividualMemberDTO dto) memberId = dto.getId();
        else if (member instanceof CorpMemberDTO dto) memberId = dto.getId();

        if (memberId == null) return ResponseEntity.status(401).build();
        qnaLikesService.toggleLike(memberId, qnaId);
        return ResponseEntity.ok().build();
    }
}
