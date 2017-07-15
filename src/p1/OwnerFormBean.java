package p1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;

import p1.DBInfo;

public class OwnerFormBean
{
	public static java.sql.Timestamp getCurrentTimeStamp()
	{
		java.util.Date today = new java.util.Date();
		return new java.sql.Timestamp(today.getTime());
	}
	
	String postid,postedby,name,htype,accomodate,price,houseno,street,city,state,fromdate,title,description,bed,bathroom,minstay,amenities;

	public String getAmenities() {
		return amenities;
	}

	public void setAmenities(String amenities) {
		this.amenities = amenities;
	}


	

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}


	public String getPostedby() {
		return postedby;
	}

	public void setPostedby(String postedby) {
		this.postedby = postedby;
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

	public void setPostid(String postid) {
		this.postid = postid;
	}
	
	public String getPostid() {
		return postid;
	}

	

	public String getHtype() {
		return htype;
	}

	public void setHtype(String htype) {
		this.htype = htype;
	}

	public String getAccomodate() {
		return accomodate;
	}

	public void setAccomodate(String accomodate) {
		this.accomodate = accomodate;
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

	
	public int ownerForm(String amenities, String username)
	{
		
		
		 DateFormat defaultDf = DateFormat.getDateInstance();
		Date date = new Date();
		

		this.amenities=amenities;
		System.out.println(""+amenities);
		System.out.println("this"+this.amenities);
		Connection con=DBInfo.getConnection();
		String query="insert into house values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try
		{
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,postid);
			ps.setString(2,title);
			ps.setString(3,username);
			ps.setString(4,name);
			ps.setString(5,postedby);
			ps.setString(6,htype);
			ps.setString(7,accomodate);
			ps.setString(8,price);
			ps.setString(9,houseno);
			ps.setString(10,street);
			ps.setString(11,city);
			ps.setString(12,state);
			ps.setString(13,fromdate);
			ps.setString(14,minstay);
			ps.setString(15,bed);
			ps.setString(16,bathroom);
			ps.setString(17,defaultDf.format(date));
			ps.setString(18,description);
			ps.setString(19,amenities);
			
			
			
			ps.executeUpdate();
			ps.close();
			
		}catch(SQLException e){e.printStackTrace();}
		
		return 1;
	}	
}


