package dao;

import java.sql.*;
import java.util.*;

import util.*;
import vo.*;

public class CityDao {

	// addressList
	public ArrayList<CityAndCountry> SelectCity() throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT co.*,ci.* FROM country co INNER JOIN city ci ON ci.country_id = co.country_id ORDER BY ci.city_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<CityAndCountry> list = new ArrayList<CityAndCountry>();
		while (rs.next()) {
			CityAndCountry ad = new CityAndCountry();

			City city = new City();
			city.setCity(rs.getString("city"));
			// System.out.println(city.getCity());
			city.setCityId(rs.getInt("city_id"));
			city.setCountryId(rs.getInt("country_id"));
			city.setLastUpdate(rs.getString("last_update"));

			ad.setCity(city);

			Country country = new Country();
			country.setCountry(rs.getString("country"));
			country.setCountryId(rs.getInt("country_id"));
			country.setLastUpdate(rs.getString("last_update"));

			ad.setCountry(country);

			list.add(ad);
		}
		return list;
	}

	public ArrayList<City> selectCityIdListAll() throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "SELECT city_id, city FROM city";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<City> list = new ArrayList<City>();
		while (rs.next()) {
			City city = new City();
			city.setCityId(rs.getInt("city_id"));
			city.setCity(rs.getString("city"));
			list.add(city);
		}
		return list;
	}

	public ArrayList<City> selectCityIdListAll(int rowPerPage, int beginRow, String searchWord) {
		return null;
	}

	// insertCityAction
	public void insertCity(City c) throws Exception {
		System.out.println("CityDao.insertCity()");
		System.out.println(c.getCity() + " <-- c.getCity");
		System.out.println(c.getCountryId() + " <-- c.getCountryId");

		String sql = "INSERT INTO city(city, country_id, last_update) VALUES(?, ?, now())";

		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, c.getCity());
		stmt.setInt(2, c.getCountryId());
		stmt.executeUpdate();
	}
}
