package p1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeletePostInfoBean
{
	
	public int deletePost(String postid)
	{
		Connection con= DBInfo.getConnection();
		String query="delete from house where postid=?";
		String query1="delete from houseimage where postid=?";
		try
		{
			PreparedStatement ps=con.prepareStatement(query);
			PreparedStatement ps1=con.prepareStatement(query1);
			ps.setString(1, postid);
			ps1.setString(1, postid);
			ps.executeUpdate();
			ps1.executeUpdate();
		}catch(SQLException e){e.printStackTrace();}
		return 1;
	}
	
}
