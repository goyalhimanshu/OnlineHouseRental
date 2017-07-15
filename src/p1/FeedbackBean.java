package p1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FeedbackBean
{
	String username,email,feedback;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public int feedbackSend()
	{
		Connection con=DBInfo.getConnection();
		String query="insert into feedbackform values(?,?,?)";
		try
		{
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,username);
			ps.setString(2, email);
			ps.setString(3, feedback);
			ps.executeUpdate();
			ps.close();


		}catch(SQLException e){System.out.println(e.getMessage());}
		return 1;
	}
}
