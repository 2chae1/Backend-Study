package com.clone.userservice.repository;

import com.clone.userservice.domain.Member;
import java.util.List;
import java.util.Optional;

public interface MemberRepository {
    Member save(Member member);
    Optional<Member> findByID(int id);
    Optional<Member> findByName(String name);
    List<Member> findAll();
}
