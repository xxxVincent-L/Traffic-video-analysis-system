package user.center;
/*
 * 待完成：用MVC模式分开DB和Action操作
 * 增删改查看导印统功能的实现
 */

import device.dao.Data;
import device.dao.DeviceDao;
import org.json.JSONException;
import org.json.JSONObject;
import user.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

public class ServletAction extends HttpServlet {
	String module="device";
	String sub="file";
	public void showDebug(String msg){
		System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"]["+module+"/"+sub+"/ServletAction]"+msg);
	}
	/*
	 * 处理顺序：先是service，后根据情况doGet或者doPost
	 */
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		processAction(request,response);
	}
	/*========================================函数分流 开始========================================*/
	public void processAction(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		boolean actionOk = false;
		int resultCode=0;
		String resultMsg="ok";
		JSONObject json=new JSONObject();
		showDebug("processAction收到的action是："+action);
		if (action == null){
			resultMsg="传递过来的action是NULL";
		}else{
			//这几个常规增删改查功能
			if (action.equals("get_device_record")) {
				actionOk=true;
				try {
					getDeviceRecord(request, response, json);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (action.equals("insert_user_information")) {
				actionOk=true;
				try {
					insert_user_information(request, response, json);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (action.equals("verify_register_name_email")) {
				actionOk=true;
				try {
					verify_register_name_email(request, response, json);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (action.equals("reset_user_password")) {
				actionOk=true;
				try {
					reset_user_password(request, response, json);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (action.equals("add_device_record")) {
				actionOk=true;
				try {
					addDeviceRecord(request, response, json);
				} catch (JSONException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (action.equals("modify_device_record")) {
				actionOk=true;
				try {
					modifyDeviceRecord(request, response, json);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (action.equals("login")) {
				actionOk=true;
				try {
					login(request, response, json);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (action.equals("delete_device_record")) {
				actionOk=true;
				try {
					deleteDeviceRecord(request, response, json);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			try {
				responseBack(request,response,json);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}
	/*========================================函数分流 结束========================================*/
	/*========================================公共函数 开始========================================*/
	private Data getPageParameters(HttpServletRequest request,HttpServletResponse response,JSONObject json) throws JSONException{
		Data data=new Data();
		HttpSession session = request.getSession();
		/*----------------------------------------获取所有表单信息 开始----------------------------------------*/
		showDebug("[getPageParameters]----------------------------------------获取所有表单信息 开始----------------------------------------");
		JSONObject param=data.getParam();
		Enumeration requestNames=request.getParameterNames();
		for(Enumeration e=requestNames;e.hasMoreElements();){
			String thisName=e.nextElement().toString();
			String thisValue=request.getParameter(thisName);
			showDebug("[getPageParameters]"+thisName+"="+thisValue);
			showDebug(data.getParam().toString());
			param.put(thisName, thisValue);
		}
		String[] ids=request.getParameterValues("ids[]");if(ids!=null){param.put("ids[]",ids);}			//后头用这样来取出：String[] ids=(String[])(data.getParam().get("ids[]"));
		showDebug("[getPageParameters]----------------------------------------获取所有表单信息 完毕----------------------------------------");
		/*----------------------------------------获取所有表单信息 完毕----------------------------------------*/
		return data;
	}
	private void responseBack(HttpServletRequest request,HttpServletResponse response,JSONObject json) throws JSONException {
		boolean isAjax=true;if (request.getHeader("x-requested-with") == null || request.getHeader("x-requested-with").equals("com.tencent.mm")){isAjax=false;}	//判断是异步请求还是同步请求，腾讯的特殊
		if(isAjax){
			response.setContentType("application/json; charset=UTF-8");
			try {
				response.getWriter().print(json);
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			String action=json.getString("action");
			String errorNo="0";
			String errorMsg="ok";
			String url = module+"/"+sub+"/result.jsp?action="+action+"&result_code="+errorNo+ "&result_msg=" + errorMsg;
			if(json.has("redirect_url")) url=json.getString("redirect_url");
			try {
				response.sendRedirect(url);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	/*========================================公共函数 结束========================================*/
	/*========================================CRUD业务函数 开始========================================*/
	private void getDeviceRecord(HttpServletRequest request, HttpServletResponse response,JSONObject json) throws JSONException, SQLException {
		DeviceDao dao=new DeviceDao();
		Data data=getPageParameters(request,response,json);
		dao.getDeviceRecord(data,json);
	}
	private void modifyDeviceRecord(HttpServletRequest request, HttpServletResponse response,JSONObject json) throws JSONException, SQLException {
		DeviceDao dao=new DeviceDao();
		Data data=getPageParameters(request,response,json);
		dao.modifyDeviceRecord(data,json);
	}
	private void deleteDeviceRecord(HttpServletRequest request, HttpServletResponse response,JSONObject json) throws JSONException, SQLException {
		DeviceDao dao=new DeviceDao();
		Data data=getPageParameters(request,response,json);
		dao.deleteDeviceRecord(data,json);
	}
	private void addDeviceRecord(HttpServletRequest request, HttpServletResponse response,JSONObject json) throws JSONException, SQLException {
		DeviceDao dao=new DeviceDao();
		Data data=getPageParameters(request,response,json);
		dao.addDeviceRecord(data,json);
	}
	/*========================================CRUD业务函数 结束========================================*/
	private void login(HttpServletRequest request, HttpServletResponse response,JSONObject json) throws JSONException, SQLException {
		UserDao dao=new UserDao();
		Data data=getPageParameters(request,response,json);
		showDebug("收到了数据："+data.getParam().getString("username"));
		showDebug("收到了数据："+data.getParam().getString("password"));
		dao.login(data,json);
		if(json.getInt("result_code") ==0){
			json.put("redirect_url","http://localhost:8080/BigHomework_war_exploded/main/index.jsp");
		}else{
			json.put("wrong_code","用户名或密码错误，请重新输入");
		}
	}

	private void verify_register_name_email(HttpServletRequest request, HttpServletResponse response,JSONObject json) throws JSONException, SQLException {
		UserDao dao=new UserDao();
		Data data=getPageParameters(request,response,json);
		showDebug("收到了数据："+data.getParam().getString("username"));
		showDebug("收到了数据："+data.getParam().getString("email"));
		dao.verify_register_name_email(data,json);
		if(json.getInt("result_code") ==0){
			json.put("redirect_url","http://localhost:8080/BigHomework_war_exploded/main/index.jsp");
		}else{
			json.put("wrong_code","用户名或密码错误，请重新输入");
		}
	}

	private void insert_user_information(HttpServletRequest request, HttpServletResponse response,JSONObject json) throws JSONException, SQLException {
		UserDao dao=new UserDao();
		Data data=getPageParameters(request,response,json);
		showDebug("收到了数据："+data.getParam().getString("username"));
		showDebug("收到了数据："+data.getParam().getString("email"));
		showDebug("收到了数据："+data.getParam().getString("password"));
		dao.insert_user_information(data,json);
	}

	private void reset_user_password(HttpServletRequest request, HttpServletResponse response,JSONObject json) throws JSONException, SQLException {
		UserDao dao=new UserDao();
		Data data=getPageParameters(request,response,json);
		showDebug("收到了数据："+data.getParam().getString("username"));
		showDebug("收到了数据："+data.getParam().getString("email"));
		showDebug("收到了数据："+data.getParam().getString("password"));
		dao.reset_user_password(data,json);
	}
}

