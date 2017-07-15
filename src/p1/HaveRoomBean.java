package p1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;

public class HaveRoomBean
{
	String postid,name,propertytype,bedroom,bathroom,roomtorent,rent,roomtype,fromdate,minstay,housematespresent,pgender,poccupation,pagefrom,pageto,advertiser,title,description;
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPostid() {
		return postid;
	}

	public void setPostid(String postid) {
		this.postid = postid;
	}

	public String getPropertytype() {
		return propertytype;
	}

	public void setPropertytype(String propertytype) {
		this.propertytype = propertytype;
	}

	public String getBedroom() {
		return bedroom;
	}

	public void setBedroom(String bedroom) {
		this.bedroom = bedroom;
	}

	public String getBathroom() {
		return bathroom;
	}

	public void setBathroom(String bathroom) {
		this.bathroom = bathroom;
	}

	public String getRoomtorent() {
		return roomtorent;
	}

	public void setRoomtorent(String roomtorent) {
		this.roomtorent = roomtorent;
	}

	public String getRent() {
		return rent;
	}

	public void setRent(String rent) {
		this.rent = rent;
	}

	public String getRoomtype() {
		return roomtype;
	}

	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}

	public String getFromdate() {
		return fromdate;
	}

	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}

	public String getMinstay() {
		return minstay;
	}

	public void setMinstay(String minstay) {
		this.minstay = minstay;
	}

	public String getHousematespresent() {
		return housematespresent;
	}

	public void setHousematespresent(String housematespresent) {
		this.housematespresent = housematespresent;
	}

	public String getPgender() {
		return pgender;
	}

	public void setPgender(String pgender) {
		this.pgender = pgender;
	}

	public String getPoccupation() {
		return poccupation;
	}

	public void setPoccupation(String poccupation) {
		this.poccupation = poccupation;
	}

	public String getPagefrom() {
		return pagefrom;
	}

	public void setPagefrom(String pagefrom) {
		this.pagefrom = pagefrom;
	}

	public String getPageto() {
		return pageto;
	}

	public void setPageto(String pageto) {
		this.pageto = pageto;
	}

	public String getAdvertiser() {
		return advertiser;
	}

	public void setAdvertiser(String advertiser) {
		this.advertiser = advertiser;
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

	public int haveRoom(String amenities, String username)
	{
		
		
		 DateFormat defaultDf = DateFormat.getDateInstance();
		Date date = new Date();
		

		
		System.out.println(""+amenities);
	//	System.out.println("this"+this.amenities);
		Connection con3=DBInfo.getConnection();
		String query="insert into flatmate values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try
		{
			PreparedStatement ps=con3.prepareStatement(query);
			ps.setString(1,postid);
			ps.setString(2, username);
			ps.setString(3, name);
			ps.setString(4,propertytype);
			ps.setString(5,bedroom);
			ps.setString(6,bathroom);
			ps.setString(7,roomtorent);
			ps.setString(8,amenities);
			ps.setString(9,rent);
			ps.setString(10,roomtype);
			ps.setString(11,fromdate);
			ps.setString(12,minstay);
			ps.setString(13,housematespresent);
			ps.setString(14,pgender);
			ps.setString(15,poccupation);
			ps.setString(16,pagefrom);
			ps.setString(17,pageto);
			ps.setString(18,defaultDf.format(date));
			ps.setString(19,advertiser);
			ps.setString(20,title);
			ps.setString(21, description);
			ps.executeUpdate();
			ps.close();
			
		}catch(SQLException e){e.printStackTrace();}
		
		return 1;
	}	

}
