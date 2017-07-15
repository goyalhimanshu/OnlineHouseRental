package p1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegistrationBean 
{
	String username, name, email, address, dob, contact, occupation, sex;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	public int registration(String password)
	{		
		Connection con=DBInfo.getConnection();
		String query="insert into registration values(?,?,?,?,?,?,?)";
		String query1="insert into login values(?,?,?,?)";
		try 
		{
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, dob);
			ps.setString(4, address);
			ps.setString(5, contact);
			ps.setString(6, occupation);
			ps.setString(7, sex);
			ps.executeUpdate();
			ps.close();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		try 
		{
			PreparedStatement ps=con.prepareStatement(query1);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setString(4, "viewer");
			ps.executeUpdate();
			ps.close();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	return 1;
	}


}
