package p1;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import p1.DBInfo;

public class UpdatePostInfoBean
{
	String postid,htype,person,price,houseno,street,city,state,fromdate,bed,bathroom,minstay,title,description;

	public String getPostid() {
		return postid;
	}

	public void setPostid(String postid) {
		this.postid = postid;
	}

	public String getHtype() {
		return htype;
	}

	public void setHtype(String htype) {
		this.htype = htype;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getHouseno() {
		return houseno;
	}

	public void setHouseno(String houseno) {
		this.houseno = houseno;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getFromdate() {
		return fromdate;
	}

	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}

	public String getBed() {
		return bed;
	}

	public void setBed(String bed) {
		this.bed = bed;
	}

	public String getBathroom() {
		return bathroom;
	}

	public void setBathroom(String bathroom) {
		this.bathroom = bathroom;
	}

	public String getMinstay() {
		return minstay;
	}

	public void setMinstay(String minstay) {
		this.minstay = minstay;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public int updatePostInfo(String amenities)
	{
		
		Connection con=DBInfo.getConnection();
		String update="update house set title=?,housetype=?,person=?,price=?,houseno=?,street=?,city=?,state=?,fromdate=?,minstay=?,bed=?,bathroom=?,description=?,amenities=? where postid=?";
		try 
		{
			PreparedStatement ps=con.prepareStatement(update);
			ps.setString(1, title);
			ps.setString(2, htype);
			ps.setString(3, person);
			ps.setString(4, price);
			ps.setString(5, houseno);
			ps.setString(6, street);
			ps.setString(7, city);
			ps.setString(8, state);
			ps.setString(9, fromdate);
			ps.setString(10, minstay);
			ps.setString(11, bed);
			ps.setString(12, bathroom);
			ps.setString(13, description);
			ps.setString(14, amenities);
			ps.setString(15, postid);
			ps.execute();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return 0;
		
		
	}
	
	

}



