package com.oss.entities;

import java.sql.Timestamp;

public class ContactUs {
//    firstname

    String fname;
//    last name
    String lname;
//    email
    String email;
//    subject /query
    String subject;
//    date of submit
    Timestamp contactdate;
//     contact id
    int contactid;
// for saving to db

    public ContactUs(String fname, String lname, String email, String subject) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.subject = subject;
    }
//    for retrieving from db

    public ContactUs(String fname, String lname, String email, String subject, Timestamp contactdate, int contactid) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.subject = subject;
        this.contactdate = contactdate;
        this.contactid = contactid;
    }
//    getter an setters

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Timestamp getContactdate() {
        return contactdate;
    }

    public void setContactdate(Timestamp contactdate) {
        this.contactdate = contactdate;
    }

    public int getContactid() {
        return contactid;
    }

    public void setContactid(int contactid) {
        this.contactid = contactid;
    }
    

}
