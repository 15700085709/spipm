package com.ywx.tiles.account.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.ywx.core.orm.Page;
import com.ywx.tiles.account.entity.Team;
import com.ywx.tiles.account.service.TeamService;
import com.ywx.tiles.account.service.UserService;

@Controller
@RequestMapping("/team")
public class TeamControl {
	@Autowired
	private TeamService teamService;	
	@Autowired
	private UserService userService;
	private  HttpServletRequest request;
	private  HttpServletResponse response;
	private HttpSession session;
	private int teamCodeCount = 0;
	private String orderBy;
	private boolean isAsc;
	private Page<Team> teamPage = new Page<Team>(1,10);
	   @ModelAttribute

	   public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

	       this.request = request;

	       this.response = response;

	       this.session = request.getSession();

	   }
	
	   public List<Team> pageList(){
		   return teamService.queryForPage(teamPage.getFirst()-1, teamPage.getPageSize(), orderBy, isAsc);
	   } 
	   
		@RequestMapping(value = "/teamList", method = RequestMethod.GET)
		public String list(@RequestParam("pageNo") String pageNo, Map<String, Object> map){
			
			teamPage.setPageNo(pageNo==null?1:Integer.parseInt(pageNo));
			teamPage.setTotalCount(teamService.getTeamList().size());
			List<Team> teamList = teamService.queryForPage(teamPage.getFirst()-1, teamPage.getPageSize(), orderBy, isAsc);
			map.put("teamList", teamList);
			session.setAttribute("teamPage", teamPage);
			for(Team team : teamList){
				System.out.println(team.getTeamCode());
			}
			return "../../teamInfo";
		}  

	@RequestMapping(value = "/teamDelete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") String id, Map<String, Object> map) {

		System.out.println(id);
		teamService.deleteById(id);
		System.out.println(id);
		List<Team> teamLists = pageList();
		map.put("teamList", teamLists);
		teamPage.setTotalCount(teamService.getTeamList().size());
		session.setAttribute("teamPage", teamPage);
		return "../../teamInfo";

	}
	@RequestMapping(value = "/teamUpdate", method = RequestMethod.POST)
	public String update(Team team, Map<String, Object> map) {
		System.out.println(team.getId());
		teamService.updateTeam(team);
		List<Team> teamLists = pageList();
		map.put("teamList", teamLists);
		System.out.println(map.get("teamList"));
		return "../../teamInfo";
	}
	@RequestMapping(value = "/teamAdd", method = RequestMethod.POST)
	public String add(Team team, Map<String, Object> map) {
		String message = "";
		List<Team> teamList = teamService.getTeamBy("teamCode", team.getTeamCode());
		if(teamList.size()==0){
			teamService.addTeam(team);
			try
			{
				message = "添加团队信息成功！";
			}catch(Exception e){
				message = "添加团队信息失败！";
			}

		}else{
			message = "该团队代号已存在！";
		}
		List<Team> teamLists = pageList();

		map.put("teamList", teamLists);
		System.out.println(map.get("teamList"));
		map.put("message", message);
		teamPage.setTotalCount(teamService.getTeamList().size());
		session.setAttribute("teamPage", teamPage);
		return "../../teamInfo";
	}
	
	@RequestMapping(value = "/teamOrder", method = RequestMethod.GET)
	public String order(String orderBy, Map<String, Object> map) {
		this.orderBy = orderBy;
		if((teamCodeCount++)%2 != 0)
			isAsc = true;
		else
			isAsc = false;
		List<Team> teamLists = pageList();
		map.put("teamList", teamLists);
		System.out.println(orderBy+ isAsc);
		return "../../teamInfo";
	}
	
	@RequestMapping(value = "/teamDeleteCheck", method = RequestMethod.POST)
	public String deleteCheck(String[] teamCheck, Map<String, Object> map) {
		for(String teamId : teamCheck){
			teamService.deleteById(teamId);
		}
		List<Team> teamLists = pageList();
		map.put("teamList", teamLists);
		return "../../teamInfo";
	}
	@ResponseBody
	@RequestMapping(value = "/getAllUser", method = RequestMethod.POST)
	public Map<String, Object> getAllUser(@RequestBody String id){
		System.out.println("asd0"+id);

		Map<String, Object> allUsers  = new HashMap<String, Object>();
		List<Team> teamLists = teamService.getTeamBy("id", id.substring(3));
		if(teamLists!=null&&teamLists.size()!=0&&teamLists.get(0).getTeamNumber()!=null){
			String teamNumbers[] = teamLists.get(0).getTeamNumber().split(",");
			String teamNumberCondition = "";
			for(String teamNumber:teamNumbers)
				teamNumberCondition += "'" + teamNumber.substring(teamNumber.indexOf("(")+1, teamNumber.indexOf(")")) + "',";
			if(teamNumberCondition.length()!=0)
				teamNumberCondition = teamNumberCondition.substring(0, teamNumberCondition.length()-1);

			allUsers.put("selectNumber",userService.getUserByHQL("from User user where user.userId not in("+teamNumberCondition+")"));
		}else{
			allUsers.put("selectNumber",userService.getUserList());
		}
		allUsers.put("users",userService.getUserList());
		
		return allUsers;
	}
	
	
}
