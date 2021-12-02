package org.but.feec.bdsproject.services;


import org.but.feec.bdsproject.data.PersonRepository;
/**
 * @author Vladimir Penaz
 */

public class AuthService {
    private PersonRepository personRepository;

    public AuthService(PersonRepository personRepository){
        this.personRepository = personRepository;
    }
}
