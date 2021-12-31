package org.but.feec.bdsProject.data;

import org.but.feec.bdsProject.api.*;
import org.but.feec.bdsProject.config.DataSourceConfig;
import org.but.feec.bdsProject.exceptions.DataAccessException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PersonRepository {


    public PersonAuthView findPersonByEmail(String email) {
        try (Connection connection = DataSourceConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT username, pwd" +
                             " FROM airport_sys.customer p" +
                             " WHERE p.username = ?")
        ) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return mapToPersonAuth(resultSet);
                }
            }
        } catch (SQLException e) {
            throw new DataAccessException("Find person by ID with addresses failed.", e);
        }
        return null;
    }

    public PersonDetailView findPersonDetailedView(Long personId) {
        try (Connection connection = DataSourceConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT id_customer, given_name, family_name, username, date_of_birth, city, street, house_number" +
                            " FROM (SELECT c.id_customer, id_address, given_name, family_name, username, date_of_birth" +
                                " FROM airport_sys.customer c" +
                                " LEFT JOIN airport_sys.customer_has_address a ON c.id_customer = a.id_customer) as ac" +
                            " LEFT JOIN airport_sys.address ad ON ad.id_address = ac.id_address" +
                            " WHERE id_customer = ?")
             ) {
            preparedStatement.setLong(1, personId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return mapToPersonDetailView(resultSet);
                }
            }
        } catch (SQLException e) {
            throw new DataAccessException("Find person by ID with addresses failed.", e);
        }
        return null;
    }

    /**
     * What will happen if we do not use LEFT JOIN? What persons will be returned? Ask your self and repeat JOIN from the presentations
     *
     * @return list of persons
     */

    public List<PersonBasicView> getPersonsBasicView() {
        try (Connection connection = DataSourceConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT id_customer, given_name, family_name, username, city" +
                             " FROM (SELECT c.id_customer, id_address, given_name, family_name, username" +
                             " FROM airport_sys.customer c" +
                             " LEFT JOIN airport_sys.customer_has_address a ON c.id_customer = a.id_customer) as ac" +
                             " LEFT JOIN airport_sys.address ad ON ad.id_address = ac.id_address");
             ResultSet resultSet = preparedStatement.executeQuery();) {
            List<PersonBasicView> personBasicViews = new ArrayList<>();
            while (resultSet.next()) {
                personBasicViews.add(mapToPersonBasicView(resultSet));
            }
            return personBasicViews;
        } catch (SQLException e) {
            throw new DataAccessException("Persons basic view could not be loaded.", e);
        }
    }

    public void createPerson(PersonCreateView personCreateView) {
        String insertPersonSQL = "INSERT INTO airport_sys.customer (given_name, family_name, date_of_birth, pwd) VALUES (?,?,?,?);";
        try (Connection connection = DataSourceConfig.getConnection();
             // would be beneficial if I will return the created entity back
             PreparedStatement preparedStatement = connection.prepareStatement(insertPersonSQL, Statement.RETURN_GENERATED_KEYS)) {
            // set prepared statement variables
            preparedStatement.setString(1, personCreateView.getGivenName());
            preparedStatement.setString(2, personCreateView.getFamilyName());
            preparedStatement.setString(3, personCreateView.getBirthDate());
            preparedStatement.setString(4, String.valueOf(personCreateView.getPwd()));


            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new DataAccessException("Creating person failed, no rows affected.");
            }
        } catch (SQLException e) {
            throw new DataAccessException("Creating person failed operation on the database failed.");
        }
    }



    public void editPerson(PersonEditView personEditView) {
        String insertPersonSQL = "UPDATE airport_sys.customer p SET username = ?, given_name = ?, family_name = ? WHERE p.id_customer = ?";
        String checkIfExists = "SELECT username FROM airport_sys.customer p WHERE p.id_customer = ?";
        try (Connection connection = DataSourceConfig.getConnection();
             // would be beneficial if I will return the created entity back
             PreparedStatement preparedStatement = connection.prepareStatement(insertPersonSQL, Statement.RETURN_GENERATED_KEYS)) {
            // set prepared statement variables
            preparedStatement.setString(1, personEditView.getUsername());
            preparedStatement.setString(2, personEditView.getGivenName());
            preparedStatement.setString(3, personEditView.getFamilyName());
            preparedStatement.setLong(4, personEditView.getId());

            try {

                connection.setAutoCommit(false);

                try (PreparedStatement ps = connection.prepareStatement(checkIfExists, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setLong(1, personEditView.getId());
                    ps.execute();
                } catch (SQLException e) {
                    throw new DataAccessException("This person for edit do not exists.");
                }

                int affectedRows = preparedStatement.executeUpdate();

                if (affectedRows == 0) {
                    throw new DataAccessException("Creating person failed, no rows affected.");
                }

                connection.commit();
            } catch (SQLException e) {

                connection.rollback();
            } finally {

                connection.setAutoCommit(true);
            }
        } catch (SQLException e) {
            throw new DataAccessException("Creating person failed operation on the database failed.");
        }
    }


    private PersonAuthView mapToPersonAuth(ResultSet rs) throws SQLException {
        PersonAuthView person = new PersonAuthView();
        person.setUsername(rs.getString("username"));
        person.setPassword(rs.getString("pwd"));
        return person;
    }

    private PersonBasicView mapToPersonBasicView(ResultSet rs) throws SQLException {
        PersonBasicView personBasicView = new PersonBasicView();
        personBasicView.setId(rs.getLong("id_customer"));
        personBasicView.setUsername(rs.getString("username"));
        personBasicView.setGivenName(rs.getString("given_name"));
        personBasicView.setFamilyName(rs.getString("family_name"));
        personBasicView.setCity(rs.getString("city"));
        return personBasicView;
    }

    private PersonDetailView mapToPersonDetailView(ResultSet rs) throws SQLException {
        PersonDetailView personDetailView = new PersonDetailView();
        personDetailView.setId(rs.getLong("id_customer"));
        personDetailView.setUsername(rs.getString("username"));
        personDetailView.setGivenName(rs.getString("given_name"));
        personDetailView.setFamilyName(rs.getString("family_name"));
        personDetailView.setBirthDate(rs.getString("date_of_birth"));
        personDetailView.setCity(rs.getString("city"));
        personDetailView.setHouseNumber(rs.getString("house_number"));
        personDetailView.setStreet(rs.getString("street"));
        return personDetailView;
    }

}
