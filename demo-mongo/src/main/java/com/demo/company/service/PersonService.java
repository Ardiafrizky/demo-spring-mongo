package com.demo.company.service;

import com.demo.company.entity.Person;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface PersonService {

	void create(Person person) throws Exception;
	void update(Integer personCode, Person person) throws Exception;
	void deleteByPersonCode(Integer personCode) throws Exception;
	void updateName(Integer personCode, Person newPerson) throws Exception;
	Person findByPersonCode(Integer personCode) throws Exception;

	Page<Person> find(Pageable pageable) throws Exception;
}
