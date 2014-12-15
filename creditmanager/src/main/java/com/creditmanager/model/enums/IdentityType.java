package com.creditmanager.model.enums;

public enum IdentityType {
	DNI(0), LIBRETA_ENROLAMIENTO(1), LIBRETA_CIVICA(2);
	
    private int value;

    private IdentityType(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}