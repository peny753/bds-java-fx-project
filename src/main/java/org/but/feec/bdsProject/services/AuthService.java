package org.but.feec.bdsProject.services;


import at.favre.lib.crypto.bcrypt.BCrypt;
import org.but.feec.bdsProject.api.PersonAuthView;
import org.but.feec.bdsProject.data.PersonRepository;
import org.but.feec.bdsProject.exceptions.ResourceNotFoundException;

/**
 * @author Vladimir Penaz
 */

public class AuthService {

    private PersonRepository personRepository;

    public AuthService(PersonRepository personRepository){
        this.personRepository = personRepository;
    }

    // TODO: 19.12.2021 find out what does it mean

    private PersonAuthView findPersonByEmail(String email) {
        return personRepository.findPersonByEmail(email);
    }

    public boolean authenticate(String username, String password) {
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            return false;
        }

        PersonAuthView personAuthView = findPersonByEmail(username);
        if (personAuthView == null) {
            throw new ResourceNotFoundException("Provided username is not found.");
        }

        BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), personAuthView.getPassword());
        return result.verified;
    }
}
