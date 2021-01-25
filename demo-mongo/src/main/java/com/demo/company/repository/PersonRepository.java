package com.demo.company.repository;

import com.demo.company.entity.Person;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

public interface PersonRepository extends MongoRepository<Person, String> {
	Page<Person> findByMarkForDeleteFalse(Pageable pageable);
	Person findByPersonCode(Integer personCode);
	Person deleteByPersonCode(Integer personCode);
}
