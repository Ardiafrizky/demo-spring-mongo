package com.demo.dto;

import java.io.Serializable;
import java.util.List;

import com.demo.company.entity.Address;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PersonResponse implements Serializable {

	private Integer personCode;
	private String personName;
	private List<Address> addresses;

}
