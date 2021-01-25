package com.demo.company.service;

import com.demo.company.entity.Person;
import com.demo.company.repository.PersonRepository;
import com.demo.config.data.Credential;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class PersonServiceImpl implements PersonService {
	private static final Logger LOGGER = LoggerFactory.getLogger(PersonServiceImpl.class);

	@Autowired
	private PersonRepository personRepository;

	@Override
	public void create(Person person) throws Exception {
		person.setStoreId(MDC.get(Credential.CREDENTIAL_STORE_ID));
		personRepository.save(person);
	}

	@Override
	public void update(Integer personCode, Person person) throws Exception {
		Person currentPerson = personRepository.findByPersonCode(personCode);
		currentPerson.setPersonName(person.getPersonName());
		currentPerson.setAddresses(person.getAddresses());
		personRepository.save(currentPerson);
	}

	@Override
	public void updateName(Integer personCode, Person newPerson) throws Exception {
		Person currentPerson = personRepository.findByPersonCode(personCode);
		currentPerson.setPersonName(newPerson.getPersonName());
		personRepository.save(currentPerson);
	}

	@Override
	public Person findByPersonCode(Integer code) throws Exception {
		return personRepository.findByPersonCode(code);
	}

	@Override
	public void deleteByPersonCode(Integer code) throws Exception {
		this.personRepository.deleteByPersonCode(code);
	}

//	@Override
//	public void updateName(Integer empNo, Person person) throws Exception {
//		Person currentPerson = personRepository.findFirstByEmpNoAndMarkForDeleteFalse(empNo);
//		currentPerson.setEmpName(person.getEmpName());
//		personRepository.save(currentPerson);
//	}

	@Override
	public Page<Person> find(Pageable pageable) throws Exception {
		return personRepository.findByMarkForDeleteFalse(pageable);
	}
}
