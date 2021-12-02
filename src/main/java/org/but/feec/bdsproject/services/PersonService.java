package org.but.feec.bdsproject.services;

import org.but.feec.bdsproject.data.PersonRepository;

/**
 * @author Vladimir Penaz
 */
public class PersonService {
    private PersonRepository personRepository;

    public PersonService(PersonRepository personRepository){
        this.personRepository = personRepository;
    }
}
