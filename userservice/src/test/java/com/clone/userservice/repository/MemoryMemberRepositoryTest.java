package com.clone.userservice.repository;

import com.clone.userservice.domain.Member;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.List;

public class MemoryMemberRepositoryTest {
    MemoryMemberRepository repository = new MemoryMemberRepository();

    @Test
    public void save() {
        //임의의 Member 생성
        Member member = new Member();
        member.setName("kimsujin");

        //Member 저장
        repository.save(member);

        //저장 잘된지 체크
        Member result = repository.findByID(member.getID()).get();
        Assertions.assertEquals(result,member);
    }

    @Test
    public void findByName() {
        // Member1 생성 및 저장
        Member member1 = new Member();
        member1.setName("kimsujin");
        repository.save(member1);

        // Member2 생성 및 저장
        Member member2 = new Member();
        member2.setName("leechaewon");
        repository.save(member2);

        Member result = repository.findByName("kimsujin").get();
        Assertions.assertEquals(result, member1);
    }

    @Test
    public void findAll() {
        // Member1 생성 및 저장
        Member member1 = new Member();
        member1.setName("kimsujin");
        repository.save(member1);

        // Member2 생성 및 저장
        Member member2 = new Member();
        member2.setName("leechaewon");
        repository.save(member2);

        List<Member> result = repository.findAll();
        Assertions.assertEquals(result.size(), 2);
    }

    @AfterEach
    public void afterEach() {
        repository.clearStore();
    }
}
