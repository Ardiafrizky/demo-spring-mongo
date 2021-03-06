package com.demo.company.entity;

import com.demo.base.MongoBaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.List;

@Document(collection = Person.COLLECTION_NAME)
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Person extends MongoBaseEntity {

	public static final String COLLECTION_NAME = "person";

	public static final String FIELD_PER_CODE = "personCode";
	public static final String FIELD_PER_NAME = "personName";
	public static final String FIELD_PER_ADDRS = "addresses";

	@Field(value = Person.FIELD_PER_CODE)
	private Integer personCode;

	@Field(value = Person.FIELD_PER_NAME)
	private String personName;
	
	@Field(value = Person.FIELD_PER_ADDRS)
	private List<Address> addresses;
}
