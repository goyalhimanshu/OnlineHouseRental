/*package p1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteAdvertiserBean 
{
	public int deleteAdvertiser(String username)
	{
		Connection con= DBInfo.getConnection();
		String query="delete from houseimage where postid=(select postid from house where username=?)";
		String query1="delete from house where username=?";
		String query2="delete from registration where email=(select email from login where username=?)";
		String query3="delete from login where username=?";
		try
		{
			PreparedStatement ps=con.prepareStatement(query);
			PreparedStatement ps1=con.prepareStatement(query1);
			PreparedStatement ps2=con.prepareStatement(query2);
			PreparedStatement ps3=con.prepareStatement(query3);
			ps.setString(1, username);
			ps1.setString(1, username);
			ps2.setString(1, username);
			ps3.setString(1, username);
			ps.executeUpdate();
			ps1.executeUpdate();
			ps2.executeUpdate();
			ps3.executeUpdate();
		}catch(SQLException e){e.printStackTrace();}
		return 1;
	}

}
*/