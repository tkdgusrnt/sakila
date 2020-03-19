package dao;
import java.sql.*;
import java.util.*;
import util.*;
import vo.*;

public class CountryDao {
	
	public ArrayList<Country> selectCountryListAll(String searchWord) throws Exception{
		System.out.println(searchWord + " <-- searchWord");
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "SELECT * FROM country WHERE country like ?";
		PreparedStatement stmt1 = conn.prepareStatement(sql);
		stmt1.setString(1, "%"+ searchWord + "%");
		ResultSet rs1 = stmt1.executeQuery();
		
		ArrayList<Country> list = new ArrayList<Country>();
		while(rs1.next()) {
			Country country = new Country();
			country.setCountryId(rs1.getInt("country_id"));
			country.setCountry(rs1.getString("country"));
			country.setLastUpdate(rs1.getString("last_update"));
			list.add(country);
		}
		return list;
	}
}