package com.clone.userservice.service;

import com.clone.userservice.domain.Member;
import com.clone.userservice.repository.MemberRepository;
import com.clone.userservice.repository.MemoryMemberRepository;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MemberServiceTest {

    MemberService memberService;
    MemoryMemberRepository memberRepository;

    @BeforeEach
    public void beforeEach() {
        memberRepository = new MemoryMemberRepository();
        memberService = new MemberService(memberRepository);
    }

    @Test
    void join() {
        //given
        Member member = new Member();
        member.setName("kimsujin");

        //when
        int memberID = memberService.join(member);

        //then
        Member result = memberService.findOneMember(memberID).get();
        Assertions.assertEquals(result.getName(),member.getName());
    }

    @Test
    void joinDuplicateMember() {
        //given
        Member member1 = new Member();
        member1.setName("kimsujin");
        Member member2 = new Member();
        member2.setName("kimsujin");

        //when
        int member1ID = memberService.join(member1);
        IllegalStateException e = assertThrows(IllegalStateException.class, ()->memberService.join(member2));
        Assertions.assertEquals(e.getMessage(),"이미 존재하는 회원");

        /*
        try {
            int memberID = memberService.join(member);
            fail(); // 이름이 같음에도 가입이 가능하다...ㅠㅠ
        } catch(IllegalStateException e) {
            Assertions.assertEquals(e.getMessage(),"이미 존재하는 회원");
        }
        */
    }

    @Test
    void findAllMembers() {
    }

    @Test
    void findOneMembers() {
    }

    @AfterEach
    public void afterEach() {
        memberRepository.clearStore();
    }

}