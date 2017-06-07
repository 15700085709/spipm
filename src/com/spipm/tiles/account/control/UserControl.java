package com.spipm.tiles.account.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spipm.core.orm.Page;
import com.spipm.tiles.account.entity.Deployment;
import com.spipm.tiles.account.entity.Project;
import com.spipm.tiles.account.entity.User;
import com.spipm.tiles.account.service.DplService;
import com.spipm.tiles.account.service.ProjectService;
import com.spipm.tiles.account.service.UserService;
import com.spipm.tiles.common.support.CrudBaseSupport;

@Controller
@RequestMapping("/user")
public class UserControl extends CrudBaseSupport {

	@Autowired
	private UserService userService;
	@Autowired
	private DplService dplService;	
	@Autowired
	private ProjectService projectService;
	private  HttpServletRequest request;
	private  HttpServletResponse response;
	private HttpSession session;
	private int userIdCount = 0;
	private String orderBy;
	private boolean isAsc;
	private Page<User> userPage = new Page<User>(1,10);
	   @ModelAttribute

	   public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

	       this.request = request;

	       this.response = response;

	       this.session = request.getSession();

	   }

	   public List<User> pageList(){
		   return userService.queryForPage(userPage.getFirst()-1, userPage.getPageSize(), orderBy, isAsc);
	   } 
	   
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String list(@RequestParam("pageNo") String pageNo, Map<String, Object> map){
		
		int totalCount = userService.getUserList().size();
		userPage.setPageNo(pageNo==null?1:Integer.parseInt(pageNo));
		userPage.setTotalCount(totalCount);
		List<User> userList = userService.queryForPage(userPage.getFirst()-1, userPage.getPageSize(), orderBy, isAsc);
		map.put("userList", userList);
		session.setAttribute("userPage", userPage);
		
		
		
		for(User user : userList){
			System.out.println(user.getUserId());
		}
		return "../../userInfo";
	}
	
//	@RequestMapping("/userList")
//	public String list(Map<String, Object> map) {
//		//List<User> userList = userService.getUserList();
////		List<User> userList = userService.queryForPage(1, 1);
////		
////		Page<User> page = new Page<User>();
////		 page.setPageNo(1);
////         page.setPageSize(1);
////         page.setTotalCount(3);
////         page.setResult(userList);
////         map.put("user", page.getResult());
////		System.out.println(page.getResult().size());
////		
//
//		List<User> userList = userService.getUserList();
//
//		System.out.println(userList);
//		map.put("userList", userList);
//		return "../../userInfo";
//	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, Map<String, Object> map) {
		List<User> userList = userService.getUserBy("userId",user.getUserId(),"password",user.getPassword());
		if(userList.size()==0){
			map.put("error", "yes");
			return "../../index";
		}else{
			User user2 = userList.get(0);
			List<Deployment> dplList = null;
			if("dev".equals(user2.getType()))
				dplList = dplService.getDplBy("dplUser", user2.getUserId());
			else if("manager".equals(user2.getType())){
				List<Project> projectList = projectService.getProjectBy("manager", user2.getUserId());
				for(Project project : projectList){
					List<Deployment> dplList2 = dplService.getDplBy("dplProject", project.getProName()+"("+project.getProCode()+")");
					for(Deployment d : dplList2){
						dplList.add(d);
					}
				}
			}
			map.put("dplList", dplList);
			session.setAttribute("user", user2);
			return "../../home";
		}
	}
	
	@ResponseBody
    @RequestMapping(value = "/login2", method = RequestMethod.POST)
    public Map<String, Object> login2(@RequestBody User user, Map<String, Object> map) throws ServletException, IOException {
        Map<String, Object> map2 = new HashMap<String, Object>();
		List<User> userList = userService.getUserBy("userId",user.getUserId(),"password",user.getPassword());
		System.out.println(user.getUserId());
        if (userList.size()==0)
            map2.put("isUser", 0);
        else{
        	User user2 = userList.get(0);

            map2.put("isUser", 1);
			session.setAttribute("userSession", userList.get(0));
        }

        
        
        
        
        return map2;

    }
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		session.removeAttribute("userSession");
		return "../../index";
		
	}
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") String id, Map<String, Object> map) {

		System.out.println(id);
		userService.deleteById(id);
		System.out.println(id);
		List<User> userLists = pageList();
		map.put("userList", userLists);
		userPage.setTotalCount(userService.getUserList().size());
		session.setAttribute("userPage", userPage);
		
		return "../../userInfo";

	}
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String update(User user, Map<String, Object> map) {
		System.out.println(user.getId());
		userService.updateUser(user);
		List<User> userLists = pageList();
		map.put("userList", userLists);
		System.out.println(map.get("userList"));
		return "../../userInfo";
	}
	@RequestMapping(value = "/userAdd", method = RequestMethod.POST)
	public String add(User user, Map<String, Object> map) {
		String message = "";
		List<User> userList = userService.getUserBy("userId", user.getUserId());
		if(userList.size()==0){
			userService.addUser(user);
			try
			{
				message = "添加人员信息成功！";
			}catch(Exception e){
				message = "添加人员信息失败！";
			}

		}else{
			message = "该用户名已存在！";
		}
		List<User> userLists = pageList();

		map.put("userList", userLists);
		System.out.println(map.get("userList"));
		map.put("message", message);
		userPage.setTotalCount(userService.getUserList().size());
		session.setAttribute("userPage", userPage);
		return "../../userInfo";
	}
	
	@RequestMapping(value = "/userOrder", method = RequestMethod.GET)
	public String order(String orderBy, Map<String, Object> map) {
		this.orderBy = orderBy;
		if((userIdCount++)%2 != 0)
			isAsc = true;
		else
			isAsc = false;
		List<User> userLists = pageList();
		map.put("userList", userLists);
		System.out.println(orderBy+ isAsc);
		return "../../userInfo";
	}
	
	@RequestMapping(value = "/userDeleteCheck", method = RequestMethod.POST)
	public String deleteCheck(String[] userCheck, Map<String, Object> map) {
		for(String userId : userCheck){
			userService.deleteById(userId);
		}
		List<User> userLists = pageList();
		map.put("userList", userLists);
		return "../../userInfo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAllUser", method = RequestMethod.POST)
	public Map<String, Object> getAllUser(@RequestBody String id){
		System.out.println(id.substring(3));
		Map<String, Object> allUsers  = new HashMap<String, Object>();
		allUsers.put("users",userService.getUserList());
		return allUsers;
	}
}
