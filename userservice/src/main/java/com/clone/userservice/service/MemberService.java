package com.clone.userservice.service;

import com.clone.userservice.domain.Member;
import com.clone.userservice.repository.MemberRepository;
import com.clone.userservice.repository.MemoryMemberRepository;

import java.util.List;
import java.util.Optional;

public class MemberService {
    private final MemberRepository memberRepository;

    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    public int join(Member member) {
        validateDuplicateMember(member);  //이름이 같은지 체크
        memberRepository.save(member);
        return member.getID();
    }

    public List<Member> findAllMembers() {
        return memberRepository.findAll();
    }

    public Optional<Member> findOneMember(int memberID) {
        return memberRepository.findByID(memberID);
    }

    private void validateDuplicateMember(Member member) {
        // Optional<Member> result = memberRepository.findByName(member.getName());
        memberRepository.findByName(member.getName())
                .ifPresent( m -> {
                    throw new IllegalStateException("이미 존재하는 회원");
                });
    }

}
