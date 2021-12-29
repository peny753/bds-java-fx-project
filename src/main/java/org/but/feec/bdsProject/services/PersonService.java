package org.but.feec.bdsProject.services;

import at.favre.lib.crypto.bcrypt.BCrypt;
import org.but.feec.bdsProject.api.PersonBasicView;
import org.but.feec.bdsProject.api.PersonCreateView;
import org.but.feec.bdsProject.api.PersonDetailView;
import org.but.feec.bdsProject.api.PersonEditView;
import org.but.feec.bdsProject.data.PersonRepository;

import java.util.List;

public class PersonService {

    private PersonRepository personRepository;

    public PersonService(PersonRepository personRepository){
        this.personRepository = personRepository;
    }

    // TODO: 19.12.2021 find out what does it mean

    public PersonDetailView getPersonDetailView(Long id) {
        return personRepository.findPersonDetailedView(id);
    }

    public List<PersonBasicView> getPersonsBasicView() {
        return personRepository.getPersonsBasicView();
    }


    public void createPerson(PersonCreateView personCreateView) {
        // the following three lines can be written in one code line (only for more clear explanation it is written in three lines
        char[] originalPassword = personCreateView.getPwd();
        char[] hashedPassword = hashPassword(originalPassword);
        personCreateView.setPwd(hashedPassword);

        personRepository.createPerson(personCreateView);
    }


    public void editPerson(PersonEditView personEditView) {
        personRepository.editPerson(personEditView);
    }

    private char[] hashPassword(char[] password) {
        return BCrypt.withDefaults().hashToChar(12, password);
    }

}
