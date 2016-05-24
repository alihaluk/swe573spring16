package com.bukoop.springservice.repository;

import com.bukoop.springservice.model.Member;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 * Created by haluks on 03/05/16.
 */
public interface MemberRepository extends CrudRepository<Member, Integer> {

    Member findByMembershipCode(@Param("Code") String membershipCode);
}
