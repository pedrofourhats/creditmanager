package com.creditmanager.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.creditmanager.model.enums.Gender;
import com.creditmanager.model.enums.IdentityType;

@Entity
@Table(name="person")
public class Person extends com.creditmanager.model.Entity implements Comparable<Person> {
	
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
	
	@Column(name="addressNumber")
	private String addressNumber;

	@Column(name="addressFloor")
	private String addressFloor;

	@Column(name="addressAppartment")
	private String addressAppartment;
	
	@Column(name="postCode")
	private String postCode;
	
	@Column(name="type")
	private String type;
	
	@Column(name="active")
	private boolean active;
	
	@ManyToMany(fetch=FetchType.LAZY, mappedBy="guarantors")
	private Set<Project> guarantorProjects;
	
	@ManyToMany(fetch=FetchType.LAZY, mappedBy="holders")
	private Set<Project> holderProjects;
	
	@OneToMany(mappedBy="evaluator")
	private Set<Project> evaluatorProjects = new HashSet<Project>();
	
	@OneToMany(mappedBy="accesor")
	private Set<Project> accesorProjects = new HashSet<Project>();

	public Set<Project> getEvaluatorProjects() {
		return evaluatorProjects;
	}

	public void setEvaluatorProjects(Set<Project> evaluatorProjects) {
		this.evaluatorProjects = evaluatorProjects;
	}

	public Set<Project> getAccesorProjects() {
		return accesorProjects;
	}

	public void setAccesorProjects(Set<Project> accesorProjects) {
		this.accesorProjects = accesorProjects;
	}

	public Person(){
	}
	
	public Person(String name, String surname, IdentityType identityType, String identityNumber, Date birthDate, Gender gender, String phone, String workPhone, 
			String cellPhone, String email, String province, String locality, String address, String addressNumber, String addressFloor, String addressAppartment, 
			String postCode, String type, boolean active){
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
		this.addressNumber = addressNumber;
		this.addressFloor = addressFloor;
		this.addressAppartment = addressAppartment;
		this.postCode = postCode;
		this.type = type;
		this.active = active;
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

	public Set<Project> getGuarantorProjects() {
		return guarantorProjects;
	}

	public void setGuarantorProjects(Set<Project> guarantorProjects) {
		this.guarantorProjects = guarantorProjects;
	}

	public Set<Project> getHolderProjects() {
		return holderProjects;
	}

	public void setHolderProjects(Set<Project> holderProjects) {
		this.holderProjects = holderProjects;
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

	@Override
	public int compareTo(Person obj) {
		return getId().compareTo(obj.getId());
	}
}