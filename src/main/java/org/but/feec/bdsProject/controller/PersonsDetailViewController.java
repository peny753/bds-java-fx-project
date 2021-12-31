package org.but.feec.bdsProject.controller;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import org.but.feec.bdsProject.api.PersonDetailView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class PersonsDetailViewController {


    private static final Logger logger = LoggerFactory.getLogger(PersonsDetailViewController.class);

    @FXML
    private TextField idTextField;

    @FXML
    private TextField usernameTextField;

    @FXML
    private TextField givenNameTextField;

    @FXML
    private TextField familyNameTextField;

    @FXML
    private TextField birthDateTextField;

    @FXML
    private TextField cityTextField;

    @FXML
    private TextField houseNumberTextField;

    @FXML
    private TextField streetTextField;


    public Stage stage;

    public void setStage(Stage stage) {
        this.stage = stage;
    }

    @FXML
    public void initialize() {
        idTextField.setEditable(false);
        usernameTextField.setEditable(false);
        givenNameTextField.setEditable(false);
        familyNameTextField.setEditable(false);
        birthDateTextField.setEditable(false);
        cityTextField.setEditable(false);
        houseNumberTextField.setEditable(false);
        streetTextField.setEditable(false);

        loadPersonsData();

        logger.info("PersonsDetailViewController initialized");
    }

    private void loadPersonsData() {
        Stage stage = this.stage;
        if (stage.getUserData() instanceof PersonDetailView) {
            PersonDetailView personBasicView = (PersonDetailView) stage.getUserData();
            idTextField.setText(String.valueOf(personBasicView.getId()));
            usernameTextField.setText(personBasicView.getUsername());
            givenNameTextField.setText(personBasicView.getGivenName());
            familyNameTextField.setText(personBasicView.getFamilyName());
            birthDateTextField.setText(personBasicView.getBirthDate());
            cityTextField.setText(personBasicView.getCity());
            houseNumberTextField.setText(personBasicView.getHouseNumber());
            streetTextField.setText(personBasicView.getStreet());
        }
    }

}

