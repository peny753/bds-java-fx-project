package org.but.feec.bdsProject.controller;

import de.jensd.fx.glyphs.GlyphsDude;
//import de.jensd.fx.glyphs.fontawesome.FontAwesomeIcon;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.input.KeyCode;
import javafx.stage.Stage;
import javafx.util.Duration;
import org.but.feec.bdsProject.App;
import org.but.feec.bdsProject.data.PersonRepository;
import org.but.feec.bdsProject.exceptions.DataAccessException;
import org.but.feec.bdsProject.exceptions.ExceptionHandler;
import org.but.feec.bdsProject.exceptions.ResourceNotFoundException;
import org.but.feec.bdsProject.services.AuthService;
import org.controlsfx.validation.ValidationSupport;
import org.controlsfx.validation.Validator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Optional;

public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @FXML
    public Label usernameLabel;
    @FXML
    public Label passwordLabel;
    @FXML
    public Label vutLogo;
    @FXML
    private Button signInButton;
    @FXML
    private TextField usernameTextfield;
    @FXML
    private PasswordField passwordTextField;

    private PersonRepository personRepository;
    private AuthService authService;

    private ValidationSupport validation;

    public LoginController() {
    }

    @FXML
    private void initialize() {
        usernameTextfield.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.ENTER) {
                handleSignIn();
            }
        });
        passwordTextField.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.ENTER) {
                handleSignIn();
            }
        });
        initializeServices();
        initializeValidations();

        logger.info("LoginController initialized");
    }

    private void initializeValidations() {
        validation = new ValidationSupport();
        validation.registerValidator(usernameTextfield, Validator.createEmptyValidator("The username must not be empty."));
        validation.registerValidator(passwordTextField, Validator.createEmptyValidator("The password must not be empty."));
        signInButton.disableProperty().bind(validation.invalidProperty());
    }

    private void initializeServices() {
        personRepository = new PersonRepository();
        authService = new AuthService(personRepository);
    }

    public void signInActionHandler(ActionEvent event) {
        handleSignIn();
    }

    private void handleSignIn() {
        String username = usernameTextfield.getText();
        String password = passwordTextField.getText();
        //todo vyresit si sam autentizaci vymazat vypisy
        try {
            boolean authenticated = authService.authenticate(username, password);
            if (authenticated) {
                System.out.println("v pohode");
                showPersonsView();
            } else {
                System.out.println("blby heslo sefe");
                showInvalidPaswordDialog();
            }
        } catch (ResourceNotFoundException | DataAccessException e) {
            System.out.println("nejsi v databazi");
            showInvalidPaswordDialog();
        }
    }

    private void showPersonsView() {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(App.class.getResource("fxml/Persons.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 1050, 600);
            Stage stage = new Stage();
            stage.setTitle("BDS JavaFX Demo App");
            stage.setScene(scene);

            Stage stageOld = (Stage) signInButton.getScene().getWindow();
            stageOld.close();

            authConfirmDialog();

            stage.show();
        } catch (IOException ex) {
            ExceptionHandler.handleException(ex);
        }
    }

    private void showInvalidPaswordDialog() {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle("Unauthenticated");
        alert.setHeaderText("The user is not authenticated");
        alert.setContentText("Please provide a valid username and password");//ww  w . j  a  va2s  .  co  m

        alert.showAndWait();
    }


    private void authConfirmDialog() {
        Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setTitle("Logging confirmation");
        alert.setHeaderText("You were successfully logged in.");

        Timeline idlestage = new Timeline(new KeyFrame(Duration.seconds(3), new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                alert.setResult(ButtonType.CANCEL);
                alert.hide();
            }
        }));
        idlestage.setCycleCount(1);
        idlestage.play();

        Optional<ButtonType> result = alert.showAndWait();

        if (result.get() == ButtonType.OK) {
            System.out.println("ok clicked");
        } else if (result.get() == ButtonType.CANCEL) {
            System.out.println("cancel clicked");
        }
    }

    public void handleOnEnterActionPassword(ActionEvent dragEvent) {
        handleSignIn();
    }
}