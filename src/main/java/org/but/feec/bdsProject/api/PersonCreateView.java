package org.but.feec.bdsProject.api;


import java.util.Arrays;

public class PersonCreateView {

    private String givenName;
    private String familyName;
    private char[] pwd;


    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }



    public char[] getPwd() {
        return pwd;
    }

    public void setPwd(char[] pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "PersonCreateView{" +
                "givenName='" + givenName + '\'' +
                ", familyName='" + familyName + '\'' +
                ", pwd=" + Arrays.toString(pwd) +
                '}';
    }
}
