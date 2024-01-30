package org.hihigh.persistance;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class DataSourceTest {
	private static final String DRIVER = "org.mariadb.jdbc.Driver";
	
	private static final String URL = "jdbc:mariadb://localhost:3306/hihigh";
	
	private static final String USER = "hihigh";
	private static final String PW = "hihigh6183";
//	private static final String USER = "root";
//	private static final String PW = "1234";
	
	@Setter(onMethod_=@Autowired)
	private FamilyMapper familymapper;
	
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		try (Connection con = DriverManager.getConnection(URL, USER, PW)){
			log.info("mariaDB 연결 성공!");
			log.info(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	

}




















