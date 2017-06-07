package com.spipm.tiles.account.control;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spipm.core.orm.Page;
import com.spipm.tiles.account.entity.Deployment;
import com.spipm.tiles.account.entity.Plan;
import com.spipm.tiles.account.entity.Project;
import com.spipm.tiles.account.entity.User;
import com.spipm.tiles.account.service.DplService;
import com.spipm.tiles.account.service.PlanService;
import com.spipm.tiles.account.service.ProjectService;
import com.spipm.tiles.account.service.UserService;

@Controller
@RequestMapping("/home")
public class HomeControl {
	@Autowired
	private UserService userService;
	@Autowired
	private DplService dplService;	
	@Autowired
	private ProjectService projectService;
	@Autowired
	private PlanService planService;
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
	   @RequestMapping(value = "/homeInfo", method = RequestMethod.GET)
		public String setState(@RequestParam("userId") String userId, Map<String, Object> map) {
		   User user2 = userService.getUserBy("userId", userId).get(0);
			List<Deployment> dplList = new ArrayList<Deployment>();
			dplList = dplService.getDplBy("dplUser", user2.getUserId());
			List<Plan> planList = new ArrayList<Plan>();
			planList = planService.getPlanBy("planReceiver", user2.getUserName()+"("+user2.getUserId()+")");
			if("pm".equals(user2.getType())){
				List<Project> projectList = projectService.getProjectBy("manager", user2.getUserName()+"("+user2.getUserId()+")");
				for(Project project : projectList){
					List<Deployment> dplList2 = dplService.getDplBy("dplProject", project.getProName()+"("+project.getProCode()+")");
					List<Plan> planList2 = planService.getPlanBy("planProject", project.getProName()+"("+project.getProCode()+")");
					for(Deployment d : dplList2){
						dplList.add(d);
					}
					for(Plan p : planList2){
						planList.add(p);
					}
				}
			}
			map.put("dplList", dplList);
			map.put("planList", planList);

			
			return "../../home";
	   }
}
