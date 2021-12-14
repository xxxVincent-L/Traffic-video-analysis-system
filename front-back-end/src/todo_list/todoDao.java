package todo_list;

import device.dao.Data;
import device.dao.Db;
import device.dao.DbRemote;
import org.json.JSONException;
import org.json.JSONObject;


import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class todoDao {
    public void showDebug(String msg){
        System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"][device/dao/Db]"+msg);
    }
    /*添加记录*/
    public void addTodoRecord(Data data, JSONObject json,int flag) throws JSONException, SQLException {
        if (flag==1){
        //构造sql语句，根据传递过来的条件参数
        String todo=data.getParam().has("todo")?data.getParam().getString("todo"):null;
        if(todo!=null){
            String sql="insert into xm02_todo(todo)";
            sql=sql+" values('"+todo+"')";
            data.getParam().put("sql",sql);
            updateRecord(data,json);
        }
        }
        else{
            String todoed=data.getParam().has("todoed")?data.getParam().getString("todoed"):null;
            if(todoed!=null){
                String sql="insert into xm02_todoed(todoed)";
                sql=sql+" values('"+todoed+"')";
                data.getParam().put("sql",sql);
                updateRecord(data,json);
            }
        }
    }
    /*删除记录*/
    public void deleteTodoRecord(Data data,JSONObject json,int flag) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的条件参数
        if (flag==1){
            String id=data.getParam().has("id")?data.getParam().getString("id"):null;
            if(id!=null){
                String sql="delete from xm02_todo where id="+data.getParam().getString("id");
                data.getParam().put("sql",sql);
                updateRecord(data,json);
            }
        }
        else{
            String id=data.getParam().has("id")?data.getParam().getString("id"):null;
            if(id!=null){
                String sql="delete from xm02_todoed where id="+data.getParam().getString("id");
                data.getParam().put("sql",sql);
                updateRecord(data,json);
            }
        }
    }
    /*修改记录*/
    public void modifyTodoRecord(Data data,JSONObject json,int flag) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的条件参数
        if (flag==1){
            String id=data.getParam().has("id")?data.getParam().getString("id"):null;
            String todo=data.getParam().has("todo")?data.getParam().getString("todo"):null;

            if(id!=null){
                String sql="update xm02_todo";
                sql=sql+" set todo='"+todo+"'";
                sql=sql+" where id="+id;
                data.getParam().put("sql",sql);
                updateRecord(data,json);
            }
        }
        else{
            String id=data.getParam().has("id")?data.getParam().getString("id"):null;
            String todoed=data.getParam().has("todoed")?data.getParam().getString("todoed"):null;

            if(id!=null){
                String sql="update xm02_todoed";
                sql=sql+" set todoed='"+todoed+"'";
                sql=sql+" where id="+id;
                data.getParam().put("sql",sql);
                updateRecord(data,json);
            }
        }
    }
    /*查询记录*/
    public void getTodoRecord(Data data,JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSql(data,1);			//构造sql语句，根据传递过来的查询条件参数
        data.getParam().put("sql",sql);
        queryRecord(data,json);
    }
    public void getTodoedRecord(Data data,JSONObject json) throws JSONException, SQLException{
        //构造sql语句，根据传递过来的查询条件参数
        String sql=createGetRecordSql(data,0);			//构造sql语句，根据传递过来的查询条件参数
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
        DbRemote updateDb = new DbRemote("yjykfsj2021");
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
        DbRemote queryDb = new DbRemote("yjykfsj2021");
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

    private String createGetRecordSql(Data data,int flag) throws JSONException {
        String sql;
        if (flag==1){
            sql="select * from xm02_todo";}
        else{
            sql="select * from xm02_todoed";
        }
//        String id=data.getParam().has("id")?data.getParam().getString("id"):null;
//        if(id!=null && !id.isEmpty())
//            sql=sql+" where id="+id;
//        String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
//        if(deviceId !=null && !deviceId.isEmpty()){
//            if(sql.indexOf("where") >-1){
//                sql = sql+" and device_id like '%" + deviceId +"%'";
//            }
//            else{
//                sql = sql+" where device_id like '%" + deviceId +"%'";
//            }
//        }
//        String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;
//        if(deviceName !=null && !deviceName.isEmpty()){
//            if(sql.indexOf("where") >-1){
//                sql = sql+" and device_name like '%" + deviceName +"%'";
//            }
//            else{
//                sql = sql+" where device_name like '%" + deviceName +"%'";
//            }
//        }
        return sql;
    }

    //加密算法
    public  static String getMD5Str(String str) {
        byte[] digest = null;
        try {
            MessageDigest md5 = MessageDigest.getInstance("md5");
            digest  = md5.digest(str.getBytes("utf-8"));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //16是表示转换为16进制数
        String md5Str = new BigInteger(1, digest).toString(16);
        return md5Str;
    }


    public void     login(Data data, JSONObject json) throws JSONException, SQLException {
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        String userName = data.getParam().getString("username");
        String password = data.getParam().getString("password");
        String action = data.getParam().getString("action");

        String Password = getMD5Str(password);
        DbRemote queryDb = new DbRemote("yjykfsj2021");
        String sql = "select * from xm02_user_file where user_name='" + userName + "' and password='" + Password + "'";
        queryDb.showDebug("[login]构造的sql语句是：" +sql);
        try{
            ResultSet rs =queryDb.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            int fieldCount = rsmd.getColumnCount();
            if(!rs.next()){
                resultCode=10;
                resultMsg="登录失败，审核用户名和密码!";
            }
            rs.close();
        }catch (Exception e){
            e.printStackTrace();
            queryDb.showDebug("[queryRecord]查询数据库出现错误："+sql);
            resultCode = 10;
            resultMsg ="查询数据库出现错误!" +e.getMessage();
        }
        queryDb.close();

        json.put("aaData",jsonList);
        json.put("action",action);
        json.put("result_msg",resultMsg);
        json.put("result_code",resultCode);
    }


    public void verify_register_name_email(Data data, JSONObject json) throws JSONException, SQLException {
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        String userName = data.getParam().getString("username");
        String email = data.getParam().getString("email");
        String action = data.getParam().getString("action");

        DbRemote queryDb = new DbRemote("yjykfsj2021");
        String sql1 = "select * from xm02_user_file where user_name='" + userName+"'";
        String sql2 = "select * from xm02_user_file where email='" + email+"'";
        String sql3 = "select email from xm02_user_file where user_name=" +"'"+userName+"'";
        queryDb.showDebug("[login]构造的sql1语句是：" +sql1);
        queryDb.showDebug("[login]构造的sql2语句是：" +sql2);
        queryDb.showDebug("[login]构造的sql3语句是：" +sql3);
        try{
            ResultSet rs1 =queryDb.executeQuery(sql1);
            if(!rs1.next()){
                resultCode=10;
                resultMsg="登录失败，审核用户名和密码!";
            }else{
                json.put("name_exist",true);
            }
            rs1.close();

            ResultSet rs2 =queryDb.executeQuery(sql2);
            if(!rs2.next()){
                resultCode=10;
                resultMsg="登录失败，审核用户名和密码!";
            }else{
                json.put("email_exist",true);
            }
            rs2.close();

            ResultSet rs3 =queryDb.executeQuery(sql3);
            if(!rs3.next()){
                resultCode=10;
                resultMsg="登录失败，审核用户名和密码!";
            }else{
                json.put("username_email_exist",true);
            }
            rs3.close();

        }catch (Exception e){
            e.printStackTrace();
            queryDb.showDebug("[queryRecord]查询数据库出现错误："+sql1);
            resultCode = 10;
            resultMsg ="查询数据库出现错误!" +e.getMessage();
        }
        queryDb.close();

        json.put("aaData",jsonList);
        json.put("action",action);
        json.put("result_msg",resultMsg);
        json.put("result_code",resultCode);
    }





    public void insert_user_information(Data data, JSONObject json) throws JSONException, SQLException {
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        String userName = data.getParam().getString("username");
        String email = data.getParam().getString("email");
        String password = data.getParam().getString("password");
        String id = data.getParam().getString("id");
        String action = data.getParam().getString("action");

        //密码加密
        String Password = getMD5Str(password);

        DbRemote queryDb = new DbRemote("yjykfsj2021");
        String sql = "insert into xm02_user_file values('"+id+"',"+"'"+userName+"',"+"'"+Password+"',"+"'User',"+"'"+email+"')";
        queryDb.showDebug("[login]构造的sql语句是：" +sql);
        try{
            queryDb.executeUpdate(sql);
            json.put("insert_ok",true);
        }catch (Exception e){
            e.printStackTrace();
            queryDb.showDebug("[queryRecord]查询数据库出现错误："+sql);
            resultCode = 10;
            resultMsg ="查询数据库出现错误!" +e.getMessage();
        }
        queryDb.close();

        json.put("aaData",jsonList);
        json.put("action",action);
        json.put("result_msg",resultMsg);
        json.put("result_code",resultCode);
    }

    public void reset_user_password(Data data, JSONObject json) throws JSONException, SQLException {
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        String userName = data.getParam().getString("username");
        String email = data.getParam().getString("email");
        String password = data.getParam().getString("password");
        String action = data.getParam().getString("action");

        //密码加密
        String Password = getMD5Str(password);

        DbRemote queryDb = new DbRemote("yjykfsj2021");
        String sql = "update xm02_user_file set password='" + Password +"' where user_name='" + userName+"'";
        queryDb.showDebug("[login]构造的sql语句是：" +sql);
        try{
            queryDb.executeUpdate(sql);
            json.put("reset_ok",true);
        }catch (Exception e){
            e.printStackTrace();
            queryDb.showDebug("[queryRecord]查询数据库出现错误："+sql);
            resultCode = 10;
            resultMsg ="查询数据库出现错误!" +e.getMessage();
        }
        queryDb.close();

        json.put("aaData",jsonList);
        json.put("action",action);
        json.put("result_msg",resultMsg);
        json.put("result_code",resultCode);
    }
}


