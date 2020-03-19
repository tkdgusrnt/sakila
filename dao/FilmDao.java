package dao;

import java.sql.*;
import java.util.*;

import util.*;
import vo.*;

public class FilmDao {
	
	public ArrayList<Film> selectFilmIdListAll() throws Exception{
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "SELECT film_id, title FROM film";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<Film> list = new ArrayList<Film>();
		while(rs.next()) {
			Film f = new Film();
			f.setFilmId(rs.getInt("film_id"));
			f.setTitle(rs.getString("title"));
			list.add(f);
		}
		return list;
	}
}