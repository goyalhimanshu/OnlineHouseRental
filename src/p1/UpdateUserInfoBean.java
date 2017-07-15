package p1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import p1.DBInfo;

public class UpdateUserInfoBean 
{
	String name,dob,address,contact,occupation,email,password,username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String addres) {
		this.address = addres;
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
	public int updateUserInfo()
	{
		Connection con=DBInfo.getConnection();
			String query="update registration set name=?,dob=?,address=?,contact=?,occupation=? where email=?";
			String query1="update login set password=? where username=?";
			try {
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, name);
				ps.setString(2, dob);
				ps.setString(3, address);
				ps.setString(4, contact);
				ps.setString(5, occupation);
				ps.setString(6, email);
				ps.executeUpdate();
				ps.close();
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			try{
			PreparedStatement ps1=con.prepareStatement(query1);
			ps1.setString(1, password);
			ps1.setString(2, username);
			ps1.executeUpdate();
			ps1.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return 1;
	}
	
		
}	
