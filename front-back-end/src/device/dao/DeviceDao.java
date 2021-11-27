package device.dao;

import org.json.JSONException;
import org.json.JSONObject;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class DeviceDao {
	public void showDebug(String msg){
		System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"][device/dao/Db]"+msg);
	}
	/*添加记录*/
	public void addDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
		//构造sql语句，根据传递过来的条件参数
		String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
		String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;
		if(deviceId!=null && deviceName!=null){
			String sql="insert into device_file(device_id,device_name)";
			sql=sql+" values('"+deviceId+"'";
			sql=sql+" ,'"+deviceName+"')";
			data.getParam().put("sql",sql);
			updateRecord(data,json);
		}
	}
	/*删除记录*/
	public void deleteDeviceRecord(Data data,JSONObject json) throws JSONException, SQLException{
		//构造sql语句，根据传递过来的条件参数
		String id=data.getParam().has("id")?data.getParam().getString("id"):null;
		if(id!=null){
			String sql="delete from device_file where id="+data.getParam().getString("id");
			data.getParam().put("sql",sql);
			updateRecord(data,json);
		}
	}
	/*修改记录*/
	public void modifyDeviceRecord(Data data,JSONObject json) throws JSONException, SQLException{
		//构造sql语句，根据传递过来的条件参数
		String id=data.getParam().has("id")?data.getParam().getString("id"):null;
		String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
		String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;
		if(id!=null){
			String sql="update device_file";
			sql=sql+" set device_id='"+deviceId+"'";
			sql=sql+" ,device_name='"+deviceName+"'";
			sql=sql+" where id="+id;
			data.getParam().put("sql",sql);
			updateRecord(data,json);
		}
	}
	/*查询记录*/
	public void getDeviceRecord(Data data,JSONObject json) throws JSONException, SQLException{
		//构造sql语句，根据传递过来的查询条件参数
		String sql=createGetRecordSql(data);			//构造sql语句，根据传递过来的查询条件参数
		data.getParam().put("sql",sql);
		queryRecord(data,json);
	}
	/*
	 * 这是一个样板的函数，可以拷贝做修改用
	 */
	private void updateRecord(Data data,JSONObject json) throws JSONException, SQLException{
		/*--------------------获取变量 开始--------------------*/
		JSONObject param=data.getParam();
		int resultCode=0;
		String resultMsg="ok";
		/*--------------------获取变量 完毕--------------------*/
		/*--------------------数据操作 开始--------------------*/
		Db updateDb = new Db("test");
		String sql=data.getParam().getString("sql");
		showDebug("[updateRecord]"+sql);
		updateDb.executeUpdate(sql);
		updateDb.close();
		/*--------------------数据操作 结束--------------------*/
		/*--------------------返回数据 开始--------------------*/
		json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
		json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
		/*--------------------返回数据 结束--------------------*/
	}
	private void queryRecord(Data data,JSONObject json) throws JSONException, SQLException{
		/*--------------------获取变量 开始--------------------*/
		String resultMsg = "ok";
		int resultCode = 0;
		List jsonList = new ArrayList();
		/*--------------------获取变量 完毕--------------------*/
		/*--------------------数据操作 开始--------------------*/
		Db queryDb = new Db("test");
		String sql=data.getParam().getString("sql");
		showDebug("[queryRecord]构造的SQL语句是：" + sql);
		try {
			ResultSet rs = queryDb.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int fieldCount = rsmd.getColumnCount();
			while (rs.next()) {
				Map map = new HashMap();
				for (int i = 0; i < fieldCount; i++) {
					map.put(rsmd.getColumnName(i + 1), rs.getString(rsmd.getColumnName(i + 1)));
				}
				jsonList.add(map);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			showDebug("[queryRecord]查询数据库出现错误：" + sql);
			resultCode = 10;
			resultMsg = "查询数据库出现错误！" + e.getMessage();
		}
		queryDb.close();
		/*--------------------数据操作 结束--------------------*/
		/*--------------------返回数据 开始--------------------*/
		json.put("aaData",jsonList);
		json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
		json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
		/*--------------------返回数据 结束--------------------*/
	}

	private String createGetRecordSql(Data data) throws JSONException {
		String sql="select * from device_file";
		String id=data.getParam().has("id")?data.getParam().getString("id"):null;
		if(id!=null && !id.isEmpty())
			sql=sql+" where id="+id;
		String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
		if(deviceId !=null && !deviceId.isEmpty()){
			if(sql.indexOf("where") >-1){
				sql = sql+" and device_id like '%" + deviceId +"%'";
			}
			else{
				sql = sql+" where device_id like '%" + deviceId +"%'";
			}
		}
		String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;
		if(deviceName !=null && !deviceName.isEmpty()){
			if(sql.indexOf("where") >-1){
				sql = sql+" and device_name like '%" + deviceName +"%'";
			}
			else{
				sql = sql+" where device_name like '%" + deviceName +"%'";
			}
		}
		return sql;
	}

	public void getGpsStatus(Data data,JSONObject json) throws JSONException, SQLException{
		/*--------------------获取变量 开始--------------------*/
		String resultMsg = "ok";
		int resultCode = 0;
		List jsonList = new ArrayList();
		String timeFrom =(new SimpleDateFormat("yyyy-MM-dd 00:00:00")).format(new Date());
		String timeTo = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
		int totalGpsActiveCount = 0;
		double average_speed =0;
		double whole_distance = 0;
		List distance_1 = new ArrayList();
		List distance_2 = new ArrayList();
		double whole_price =0;

		List<String> IDlist = new ArrayList();


		int count_chengdu=0;
		/*--------------------获取变量 完毕--------------------*/
		/*--------------------数据操作 开始--------------------*/
		DbRemote queryDb = new DbRemote("ylxdb");
		String sql1="SELECT DISTINCT  DeviceId as total from gps_history  where GPSTime BETWEEN '"+ timeFrom +"' and '" + timeTo +"'";
		String sql2 ="select sum(speed) / count(*) as average_speed from gps_history where GPSTime BETWEEN '"+ timeFrom +"' and '" + timeTo +"'";
		String sql31 ="select DISTINCT DeviceId from gps_history where GPSTime BETWEEN '"+ timeFrom +"' and '" + timeTo +"'"; //获取当前车辆ID
		String sql4 ="SELECT distinct DeviceId as count_id from gps_history  where location like '%成都%' and GPSTime BETWEEN '"+ timeFrom +"' and '" + timeTo +"'";
		showDebug("[queryRecord]构造的SQL语句是：" + sql1);
		showDebug("[queryRecord]构造的SQL语句是：" + sql2);
		showDebug("[queryRecord]构造的SQL语句是：" + sql31);
		showDebug("[queryRecord]构造的SQL语句是：" + sql4);
		try {
			ResultSet rs = queryDb.executeQuery(sql1);
			ResultSetMetaData rsmd = rs.getMetaData();
			int fieldCount = rsmd.getColumnCount();
			int count = 0;
			while (rs.next()) {
				count +=1;
			}
			totalGpsActiveCount = count;
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			showDebug("[queryRecord]查询数据库出现错误：" + sql1);
			resultCode = 10;
			resultMsg = "查询数据库出现错误！" + e.getMessage();
		}

		try {
			ResultSet rs = queryDb.executeQuery(sql2);
			ResultSetMetaData rsmd = rs.getMetaData();
			int fieldCount = rsmd.getColumnCount();
			while (rs.next()) {
				average_speed = rs.getFloat("average_speed");
				BigDecimal b = new BigDecimal(average_speed);
				average_speed = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				System.out.println(average_speed);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			showDebug("[queryRecord]查询数据库出现错误：" + sql2);
			resultCode = 10;
			resultMsg = "查询数据库出现错误！" + e.getMessage();
		}

		//获取ID
		try {
			ResultSet rs = queryDb.executeQuery(sql31);
			ResultSetMetaData rsmd = rs.getMetaData();
			int fieldCount = rsmd.getColumnCount();
			while (rs.next()) {

				String ID = rs.getString("DeviceId");
				IDlist.add(ID);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			showDebug("[queryRecord]查询数据库出现错误：" + sql31);
			resultCode = 10;
			resultMsg = "查询数据库出现错误！" + e.getMessage();
		}

		try {
			for(int i =0;i<IDlist.size();i++){
				List a = new ArrayList();
				List b = new ArrayList();
				String current_ID = IDlist.get(i);
				String sql32 ="select Longitude,Latitude from gps_history where Deviceid = "+current_ID+ " and GPSTime BETWEEN '"+ timeFrom +"' and '" + timeTo +"'"; //根据车辆ID获取经纬度
				ResultSet rs = queryDb.executeQuery(sql32);
				ResultSetMetaData rsmd = rs.getMetaData();
				int fieldCount = rsmd.getColumnCount();
				while (rs.next()) {
					int Longitude = rs.getInt(1);
					a.add(Longitude); //放置所有经度
					int Latitude = rs.getInt(2);
					b.add(Latitude);  //放置所有纬度
				}

				for (int j = 0;j<a.size()-1;j++){
					int first = (int)a.get(j);
					int second =(int)a.get(j+1);
					int distance = (first-second) *(first - second);
					distance_1.add(distance);
				}
				for (int k = 0;k<b.size()-1;k++){
					int first = (int)b.get(k);
					int second =(int)b.get(k+1);
					int distance = (first-second) *(first - second);
					distance_2.add(distance);
				}
				for(int m = 0;m<distance_1.size();m++){
					whole_distance += Math.sqrt((int)distance_1.get(m) +(int)distance_2.get(m));
				}
				rs.close();
			}
			BigDecimal pengrui = new BigDecimal(whole_distance * 0.6);
			whole_price = pengrui.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			System.out.println(whole_price);
		} catch (Exception e) {
			e.printStackTrace();
			showDebug("[queryRecord]查询数据库出现错误：" + sql31);
			resultCode = 10;
			resultMsg = "查询数据库出现错误！" + e.getMessage();
		}

		try {
			ResultSet rs = queryDb.executeQuery(sql4);
			ResultSetMetaData rsmd = rs.getMetaData();
			int fieldCount = rsmd.getColumnCount();
			while (rs.next()) {
				count_chengdu += 1;
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			showDebug("[queryRecord]查询数据库出现错误：" + sql4);
			resultCode = 10;
			resultMsg = "查询数据库出现错误！" + e.getMessage();
		}

		queryDb.close();
		/*--------------------数据操作 结束--------------------*/
		/*--------------------返回数据 开始--------------------*/
		json.put("aaData",jsonList);
		json.put("gps_vehicle_active_number",totalGpsActiveCount);
		json.put("gps_average_speed",average_speed);
		json.put("total_price",whole_price);
		json.put("count_chengdu",count_chengdu);
		json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
		json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
		/*--------------------返回数据 结束--------------------*/
	}
}
