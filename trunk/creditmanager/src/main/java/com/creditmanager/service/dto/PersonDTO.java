package com.creditmanager.service.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.creditmanager.model.enums.Gender;
import com.creditmanager.model.enums.IdentityType;

public class PersonDTO {

	private Long id;
	
	private String name;
	
	private String surname;
	
	private String identityNumber;
	
	private IdentityType identityType;
	
	private Date birthDate;
	
	private String formattedBirthDate;
	
	private Gender gender;
	
	private String genderName;
	
	private String phone;
	
	private String workPhone;
	
	private String cellPhone;
	
	private String email;
	
	private String province;

	private String address;
	
	private String addressNumber;
	
	private String addressFloor;
	
	private String addressAppartment;
	
	private String locality;
	
	private String postCode;
	
	private String type;
	
	private boolean active;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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
		this.setFormattedBirthDate(birthDate);
	}
	
	public String getFormattedBirthDate() {
		return formattedBirthDate;
	}

	public void setFormattedBirthDate(Date birthDate) {
		this.formattedBirthDate = "";
		if(birthDate != null) {
			try {
				SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
				this.formattedBirthDate = format.format(birthDate);			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
		this.setGenderName(this.gender.equals(Gender.MALE) ? "MASCULINO" : "FEMENINO");
	}

	public String getGenderName() {
		return genderName;
	}

	public void setGenderName(String genderName) {
		this.genderName = genderName;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressNumber() {
		return addressNumber;
	}

	public void setAddressNumber(String addressNumber) {
		this.addressNumber = addressNumber;
	}

	public String getAddressFloor() {
		return addressFloor;
	}

	public void setAddressFloor(String addressFloor) {
		this.addressFloor = addressFloor;
	}

	public String getAddressAppartment() {
		return addressAppartment;
	}

	public void setAddressAppartment(String addressAppartment) {
		this.addressAppartment = addressAppartment;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
}