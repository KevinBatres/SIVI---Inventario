/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codes;

//import com.mysql.jdbc.*;
import java.sql.*;

/**
 *
 * @author kevin
 */
public class selects {

    Connection cnx = null;
    Statement sta = null;
    ResultSet rs = null;

    public ResultSet getRs() {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");

            sta = cnx.createStatement();
            rs = sta.executeQuery("select * from prodcts ORDER BY id_prod");

        } catch (Exception e) {
        }

        return rs;

    }

    public ResultSet getingresos() {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");

            sta = cnx.createStatement();
            rs = sta.executeQuery("SELECT * FROM ingre, provs where ingre.id_prov = provs.id_prov ORDER BY id_ingre");

        } catch (Exception e) {
        }

        return rs;
    }

    public ResultSet getProvs() {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");

            sta = cnx.createStatement();
            rs = sta.executeQuery("SELECT * FROM provs ORDER BY id_prov");

        } catch (Exception e) {
        }

        return rs;
    }

    public ResultSet getEgresos() {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");

            sta = cnx.createStatement();
            rs = sta.executeQuery("SELECT * FROM salid ORDER BY id_salid");

        } catch (Exception e) {
        }

        return rs;
    }

    public ResultSet getSaliDet(String idet) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");

            sta = cnx.createStatement();
            rs = sta.executeQuery("SELECT prodcts.id_prod, prodcts.prod, salid_det.cant_salid FROM prodcts, salid_det WHERE prodcts.id_prod = salid_det.id_prod AND id_salid = '" + idet + "'");

        } catch (Exception e) {
        }
        return rs;
    }

    public ResultSet getIngreDet(String idit) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");

            sta = cnx.createStatement();
            rs = sta.executeQuery("SELECT prodcts.id_prod, prodcts.prod, ingre_det.cant, ingre_det.p_comp FROM prodcts, ingre_det WHERE prodcts.id_prod = ingre_det.id_prod AND ingre_det.no_fact = '" + idit + "'");

        } catch (Exception e) {
        }
        return rs;
    }

    public ResultSet getSumIngre() {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");

            sta = cnx.createStatement();
            rs = sta.executeQuery("SELECT SUM(cant), monthname(fech_ingre) FROM ingre, ingre_det WHERE no_fact = fac_prov GROUP BY MONTH(fech_ingre)");

        } catch (Exception e) {
        }
        return rs;
    }

    public ResultSet getSumSalid() {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");

            sta = cnx.createStatement();
            rs = sta.executeQuery("SELECT SUM(cant_salid), monthname(fech_salid) FROM salid, salid_det WHERE salid_det.id_salid = salid.id_salid GROUP BY MONTH(fech_salid)");

        } catch (Exception e) {
        }
        return rs;
    }

}
