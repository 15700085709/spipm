package com.ywx.tiles.account.control;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ywx.common.Encrypt;
import com.ywx.core.orm.Page;
import com.ywx.tiles.account.entity.User;
import com.ywx.tiles.account.service.UserService;
import com.ywx.tiles.account.service.impl.Base64PasswordEncoder;
import com.ywx.tiles.common.support.CrudBaseSupport;

@Controller
@RequestMapping("/user")
public class UserControl extends CrudBaseSupport {

	@Autowired
	private UserService userService;

	@RequestMapping("/userList")
	public String list(Map<String, Object> map) {
		//List<User> userList = userService.getUserList();
//		List<User> userList = userService.queryForPage(1, 1);
//		
//		Page<User> page = new Page<User>();
//		 page.setPageNo(1);
//         page.setPageSize(1);
//         page.setTotalCount(3);
//         page.setResult(userList);
//         map.put("user", page.getResult());
//		System.out.println(page.getResult().size());
//		

		List<User> userList = userService.getUserList();

		System.out.println(userList);
		map.put("userList", userList);
		return "../../page";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, Map<String, Object> map) {
//		System.out.println("用户登录。。。" + user.getLoginName());
//		List<User> userList = userService.getUserList();
//		map.put("userList", userList);
		List<User> userList = userService.getUserBy("userId",user.getUserId(),"password",Encrypt.MD5(user.getPassword()));
		if(userList.size()==0){
			map.put("error", "yes");
			return "../../index";
		}else{
			return "../../page";
		}
	}
	@RequestMapping(value = "/userDelete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") String id) {

		System.out.println(id);
		userService.deleteById(id);
		System.out.println(id);
		return "../../page";

	}
	@RequestMapping(value = "/userAdd", method = RequestMethod.POST)
	public String add(User user, Map<String, Object> map) {
		String message = "";
		List<User> userList = userService.getUserBy("userId", user.getUserId());
		if(userList.size()==0){
			user.setPassword(Encrypt.MD5(user.getPassword()));
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
		List<User> userLists = userService.getUserList();

		map.put("userList", userLists);
		System.out.println(map.get("userList"));
		map.put("message", message);
		return "../../page";
	}
	
}
