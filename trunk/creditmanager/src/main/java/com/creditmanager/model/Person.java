package com.creditmanager.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import com.creditmanager.model.enums.Gender;
import com.creditmanager.model.enums.IdentityType;

@Entity
@Table(name="person")
public class Person extends com.creditmanager.model.Entity {
	
	@Column(name="name")
	private String name;
	
	@Column(name="surname")
	private String surname;
	
	@Column(name="identityNumber")
	private String identityNumber;
	
	@Column(name="identityType")
	private IdentityType identityType;
	
	@Column(name="birthDate")
	private Date birthDate;
	
	@Column(name="gender")
	private Gender gender;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="workPhone")
	private String workPhone;
	
	@Column(name="cellPhone")
	private String cellPhone;
	
	@Column(name="email")
	private String email;
	
	@Column(name="province")
	private String province;
	
	@Column(name="locality")
	private String locality;
	
	@Column(name="address")
	private String address;
	
	@Column(name="postCode")
	private String postCode;
	
	public Person(){
	}
	
	public Person(String name, String surname, IdentityType identityType, String identityNumber, Date birthDate, Gender gender, String phone, String workPhone, String cellPhone, String email, String province,
			String locality, String address, String postCode){
		this.name = name;
		this.surname = surname;
		this.identityType = identityType;
		this.identityNumber = identityNumber;
		this.birthDate = birthDate;
		this.gender = gender;
		this.phone = phone;
		this.workPhone = workPhone;
		this.cellPhone = cellPhone;
		this.email = email;
		this.province = province;
		this.locality = locality;
		this.address = address;
		this.postCode = postCode;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getIdentityNumber() {
		return identityNumber;
	}
	
	public void setIdentityNumber(String identityNumber) {
		this.identityNumber = identityNumber;
	}
	
	@Enumerated(EnumType.ORDINAL)
	public IdentityType getIdentityType() {
		return identityType;
	}
	
	public void setIdentityType(IdentityType identityType) {
		this.identityType = identityType;
	}
	
	public Date getBirthDate() {
		return birthDate;
	}
	
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	
	@Enumerated(EnumType.ORDINAL)
	public Gender getGender() {
		return gender;
	}
	
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getWorkPhone() {
		return workPhone;
	}
	
	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone;
	}
	
	public String getCellPhone() {
		return cellPhone;
	}
	
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getProvince() {
		return province;
	}
	
	public void setProvince(String province) {
		this.province = province;
	}
	
	public String getLocality() {
		return locality;
	}
	
	public void setLocality(String locality) {
		this.locality = locality;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostCode() {
		return postCode;
	}
	
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
}