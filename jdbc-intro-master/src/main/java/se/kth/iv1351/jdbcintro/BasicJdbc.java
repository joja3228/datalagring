/*
 * The MIT License (MIT)
 * Copyright (c) 2020 Leif Lindbäck
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction,including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so,subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package se.kth.iv1351.jdbcintro;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.Scanner;

/**
 * A small program that illustrates how to write a simple JDBC program.
 */
public class BasicJdbc {

  private Scanner in = new Scanner(System.in);

  private PreparedStatement insertHyrInstrument;
  private PreparedStatement insertHyrdInstrment;

  private PreparedStatement hittaHyrInstruments;
  private PreparedStatement hittaStudentsHyrdaInstrument;
  private PreparedStatement hittaHyrtInstrument;
  private PreparedStatement hittaStudent;
  private PreparedStatement hittaValtInstrument;

  private PreparedStatement uppdateraHyrInstrument;
  private PreparedStatement uppdateraHyrdaInstrument;
  private PreparedStatement uppdateraStudent;

  private void accessDB() {
    try (Connection connection = createConnection()) {


      prepareStatements(connection);

      boolean sluta = false;

      while(!sluta){
        System.out.printf("\nskriv sifran för vad du vill göra\n 1: lista instrument som kan hyras\n 2: hyra instrument\n 3: avsluta hyrninga av instrument\n 4: avsluta program\n\n");

        int val = in.nextInt();

        if(val == 1){
          listaHyrbaraInstrument(connection);
        }
        else if(val == 2){
          hyrInstrument(connection);
        }
        else if(val == 3){
          avslutaUthyrning(connection);
        }
        else if(val == 4){
          connection.close();
          sluta = true;
        }
        else{
          System.out.printf("finns inget alternativ %d\n", val);
        }

      }



    } catch (SQLException | ClassNotFoundException exc) {
      exc.printStackTrace();
    }
  }

  private Connection createConnection() throws SQLException, ClassNotFoundException {
    Class.forName("org.postgresql.Driver");
    Connection connection =  DriverManager.getConnection("jdbc:postgresql://localhost:5432/simplejdbc",
      "postgres", "postgres");

    connection.setAutoCommit(false);
    return connection;
    // Class.forName("com.mysql.cj.jdbc.Driver");
    // return DriverManager.getConnection(
    // "jdbc:mysql://localhost:3306/simplejdbc?serverTimezone=UTC",
    // "root", "javajava");
  }


  private void handleException(Connection connection, String failureMsg) {
    String completeFailureMsg = failureMsg;
    try {
        connection.rollback();
        System.out.printf("rollback genomförd på grund av %s\n", failureMsg);
    } catch (SQLException rollbackExc) {
        System.out.printf("commit mislyckades på grund av %s, rollback mislyckades också på grund av %s \n", completeFailureMsg, rollbackExc.getMessage());
    }
  }


  private void closeResultSet(ResultSet result){
    try {
      result.close();
    } catch (Exception e) {

    }
  }



  private void prepareStatements(Connection connection) throws SQLException {
    insertHyrInstrument = connection.prepareStatement("INSERT INTO hyr_instrument(instrument, katigori, märke, antal_på_lager, pris_månad) VALUES (?, ?, ?, ?, ?)");
    insertHyrdInstrment = connection.prepareStatement("INSERT INTO hyrda_instrument(start_månad, slut_månad, student_id, hyr_instrument_id) VALUES(?, ?, ?, ?)");

    hittaHyrInstruments = connection.prepareStatement("SELECT * from hyr_instrument WHERE antal_på_lager > 0");
    hittaValtInstrument = connection.prepareStatement("SELECT * from hyr_instrument WHERE antal_på_lager > 0 AND id = ?");
    hittaStudentsHyrdaInstrument = connection.prepareStatement("SELECT * from hyrda_instrument INNER JOIN hyr_instrument ON hyrda_instrument.hyr_instrument_id = hyr_instrument.id  WHERE student_id =  ? AND slut_månad > ?");
    hittaHyrtInstrument = connection.prepareStatement("SELECT * from hyrda_instrument INNER JOIN hyr_instrument ON hyrda_instrument.hyr_instrument_id = hyr_instrument.id WHERE hyrda_instrument.id = ? AND slut_månad > ?");
    hittaStudent = connection.prepareStatement("SELECT * from student WHERE id = ?");

    uppdateraHyrInstrument = connection.prepareStatement("UPDATE hyr_instrument SET antal_på_lager = ? WHERE id = ?");
    uppdateraHyrdaInstrument = connection.prepareStatement("UPDATE hyrda_instrument SET slut_månad = ? WHERE id = ?");
    uppdateraStudent = connection.prepareStatement("UPDATE student SET antal_hyrda_instrument = ? WHERE id = ?");



    connection.commit();
  }


  private boolean finnsStudent(ResultSet student, int studentId) throws SQLException{
    if(student.next()){
      return true;
    }
    System.out.printf("finns ingen student med id %d\n", studentId);
    return false;

  }

  private boolean studentKanHyra(ResultSet student, int studentId) throws SQLException{
    if(student.next()){
      if(student.getInt(10) >=2){
        System.out.printf("du får inte hyra fler instrument\n");
        return false;
      }
      return true;
    }
    System.out.printf("finns ingen student med id %d\n", studentId);
    return false;
  }

  // private void listaHyrbaraInstrument(Connection connection){
  //   ResultSet hyrInstrument = null;
  //   try{
  //     hyrInstrument = hittaHyrInstruments.executeQuery();
  //     int temp = 0;
  //     while(hyrInstrument.next()){
  //       if(hyrInstrument.getInt(5) > 0){
  //         temp = 1;
  //         System.out.printf("id: %d, instrument: %s, märke: %s, pris/månad: %d\n",
  //         hyrInstrument.getInt(1), hyrInstrument.getString(2), hyrInstrument.getString(4), hyrInstrument.getInt(6));
  //       }
  //     }
  //     if(temp == 0){
  //       System.out.printf("finns inget instrument att hyra\n");
  //     }
  //     connection.commit();
  //   } catch(SQLException sqle){
  //     handleException(connection, sqle.getMessage());
  //   } finally{
  //     closeResultSet(hyrInstrument);
  //   }
  // }


  private void listaHyrbaraInstrument(Connection connection){
    ResultSet hyrInstrument = null;
    try{
      in.nextLine();
      System.out.printf("skriv instrument\n");
      String instrument = in.nextLine();
      hyrInstrument = hittaHyrInstruments.executeQuery();
      listaValdaHyrbaraInstrument(hyrInstrument, instrument);
      connection.commit();
    } catch(SQLException sqle){
      handleException(connection, sqle.getMessage());
    } finally{
      closeResultSet(hyrInstrument);
    }
  }

  private boolean listaValdaHyrbaraInstrument(ResultSet hyrInstrument, String instrument) throws SQLException{
    int temp = 0;
    while(hyrInstrument.next()){
      if(instrument.equals(hyrInstrument.getString(2)) && hyrInstrument.getInt(5) > 0){
        temp = 1;
        System.out.printf("id: %d, instrument: %s, märke: %s, pris/månad: %d\n",
        hyrInstrument.getInt(1), hyrInstrument.getString(2), hyrInstrument.getString(4), hyrInstrument.getInt(6));
      }
    }
    if(temp == 0){
      System.out.printf("finns inget %s att hyra\n", instrument);
      return false;
    }
    return true;
  }


  private void hyrValtInstrument(ResultSet hyrInstrument, ResultSet student, String instrument, int instrumentId, int studentId, int period) throws SQLException{

    if(hyrInstrument.next() && student.next()){
      uppdateraHyrInstrument.setInt(1, hyrInstrument.getInt(5)-1);
      uppdateraHyrInstrument.setInt(2, hyrInstrument.getInt(1));
      uppdateraHyrInstrument.executeUpdate();

      long millis = System.currentTimeMillis();
      java.sql.Date startDatum = new java.sql.Date(millis);
      java.sql.Date slutDatum = new java.sql.Date(millis + period * 2629800000L);
      insertHyrdInstrment.setDate(1, startDatum);
      insertHyrdInstrment.setDate(2, slutDatum);
      insertHyrdInstrment.setInt(3, studentId);
      insertHyrdInstrment.setInt(4, instrumentId);
      insertHyrdInstrment.executeUpdate();

      uppdateraStudent.setInt(1, student.getInt(10) + 1);
      uppdateraStudent.setInt(2, studentId);
      uppdateraStudent.executeUpdate();
      return;
    }
    System.out.printf("finns ingen %s med id %d att hyra\n", instrument, instrumentId);
  }


  private void hyrInstrument(Connection connection){
    ResultSet hyrInstrument1 = null;
    ResultSet hyrInstrument2 = null;
    ResultSet student1 = null;
    ResultSet student2 = null;

    try{
      System.out.printf("skriv student id\n");
      int studentId = in.nextInt();
      hittaStudent.setInt(1, studentId);
      student1 = hittaStudent.executeQuery();

      if(!studentKanHyra(student1, studentId)){
        return;
      }
      in.nextLine();
      System.out.printf("skriv instrument\n");
      String instrument = in.nextLine();
      hyrInstrument1 = hittaHyrInstruments.executeQuery();

      if(!listaValdaHyrbaraInstrument(hyrInstrument1, instrument)){
        return;
      }

      System.out.printf("skriv id på den %s du vil hyra\n", instrument);
      int instrumentId = in.nextInt();
      System.out.printf("hur många månader vill du hyra %s\n", instrument);
      int period = in.nextInt();

      if(period > 12){
        System.out.printf("du får inte hyra mer än 12 månader\n");
        return;
      }

      hittaValtInstrument.setInt(1, instrumentId);
      hyrInstrument2 = hittaValtInstrument.executeQuery();
      hittaStudent.setInt(1, studentId);
      student2   = hittaStudent.executeQuery();

      hyrValtInstrument(hyrInstrument2, student2, instrument, instrumentId, studentId, period);

      connection.commit();
      System.out.printf("instrument hyrt\n");
    } catch(SQLException sqle){
      handleException(connection, sqle.getMessage());
    } finally{
      closeResultSet(hyrInstrument1);
      closeResultSet(student1);
      closeResultSet(hyrInstrument2);
      closeResultSet(student2);
    }

  }


  private boolean hyrdaInstrument(ResultSet hyrdaInstrument, int studentId) throws SQLException{
    int temp = 0;
    while(hyrdaInstrument.next()){
      if(hyrdaInstrument.getInt(4) == studentId){
        temp = 1;
        System.out.printf("id: %d, instrument: %s, start datum: %s, slut datum: %s\n",
          hyrdaInstrument.getInt(1), hyrdaInstrument.getString(7), hyrdaInstrument.getString(2), hyrdaInstrument.getString(3));
      }
    }
    if(temp == 0){
      System.out.printf("du har inte hyrt några instrument\n");
      return false;
    }
    return true;
  }

  private void avslutaValdUthyrning(ResultSet hyrtInstrument, ResultSet student, int hyrId, int studentId, java.sql.Date slutDatum) throws SQLException{

    if(hyrtInstrument.next() && hyrtInstrument.getInt(4) == studentId && student.next()){

      uppdateraHyrdaInstrument.setDate(1, slutDatum);
      uppdateraHyrdaInstrument.setInt(2, hyrId);
      uppdateraHyrdaInstrument.executeUpdate();

      uppdateraHyrInstrument.setInt(1, hyrtInstrument.getInt(10) + 1);
      uppdateraHyrInstrument.setInt(2, hyrtInstrument.getInt(6));
      uppdateraHyrInstrument.executeUpdate();

      uppdateraStudent.setInt(1, student.getInt(10) - 1);
      uppdateraStudent.setInt(2, studentId);
      uppdateraStudent.executeUpdate();

    }
    else{
      System.out.printf("du har igen uthyrning med id %d\n", hyrId);
    }

  }


  private void avslutaUthyrning(Connection connection){
    ResultSet hyrdaInstrument = null;
    ResultSet hyrtInstrument = null;
    ResultSet student1 = null;
    ResultSet student2 = null;
    try{
      System.out.printf("skriv student id\n");
      int studentId = in.nextInt();
      hittaStudent.setInt(1, studentId);
      student1 = hittaStudent.executeQuery();

      if(!finnsStudent(student1, studentId)){
        return;
      }

      hittaStudentsHyrdaInstrument.setInt(1, studentId);
      long millis = System.currentTimeMillis();
      java.sql.Date slutDatum = new java.sql.Date(millis);
      hittaStudentsHyrdaInstrument.setDate(2, slutDatum);
      hyrdaInstrument = hittaStudentsHyrdaInstrument.executeQuery();

      if(!hyrdaInstrument(hyrdaInstrument, studentId)){
        return;
      }

      System.out.printf("skriv id på det uthyrning du vill avsluta\n");
      int hyrId = in.nextInt();

      hittaHyrtInstrument.setInt(1, hyrId);
      hittaHyrtInstrument.setDate(2,slutDatum);
      hyrtInstrument = hittaHyrtInstrument.executeQuery();

      hittaStudent.setInt(1, studentId);
      student2 = hittaStudent.executeQuery();

      avslutaValdUthyrning(hyrtInstrument, student2, hyrId, studentId, slutDatum);


      connection.commit();
      System.out.printf("uthyrning avsluta\n");
    } catch (SQLException sqle){
      handleException(connection, sqle.getMessage());
    } finally{
      closeResultSet(hyrdaInstrument);
      closeResultSet(hyrtInstrument);
      closeResultSet(student1);
      closeResultSet(student2);
    }

  }

  public static void main(String[] args) {
    new BasicJdbc().accessDB();
  }
}
