package com.demo.company.entity;

import com.demo.base.MongoBaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = Address.COLLECTION_NAME)
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Address extends MongoBaseEntity {

	public static final String COLLECTION_NAME = "person";

	public static final String FIELD_ADDR_NAME = "addressName";
	public static final String FIELD_ADDR_ADDR = "address";
	public static final String FIELD_ADDR_CITY = "city";

	@Field(value = Address.FIELD_ADDR_NAME)
	private String adressName;

	@Field(value = Address.FIELD_ADDR_ADDR)
	private String address;
	
	@Field(value = Address.FIELD_ADDR_CITY)
	private String city;
}
