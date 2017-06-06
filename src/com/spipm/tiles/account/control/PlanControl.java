package com.spipm.tiles.account.control;

import java.io.OutputStream;
import java.sql.Timestamp;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.spipm.core.orm.Page;
import com.spipm.tiles.account.entity.Deployment;
import com.spipm.tiles.account.entity.Plan;
import com.spipm.tiles.account.entity.User;
import com.spipm.tiles.account.entity.Project;
import com.spipm.tiles.account.service.PlanService;
import com.spipm.tiles.account.service.ProjectService;
import com.spipm.tiles.common.support.CrudBaseSupport;
@Controller
@RequestMapping("/plan")
public class PlanControl extends CrudBaseSupport {
	@Autowired
	private PlanService planService;
	@Autowired
	private ProjectService projectService;
	private  HttpServletRequest request;
	private  HttpServletResponse response;
	private HttpSession session;
	private int planIdCount = 0;
	private String orderBy;
	private boolean isAsc;
	private Page<Plan> planPage = new Page<Plan>(1,10);
	   @ModelAttribute

	   public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

	       this.request = request;

	       this.response = response;

	       this.session = request.getSession();

	   }
	@RequestMapping(value="/json", method = RequestMethod.GET)  
    public @ResponseBody List<Plan> getShopInJSON() {  
  
		List<Plan> planList = planService.getPlanList();
          
        return planList;  
  
    }  
	
	
	   public List<Plan> pageList(){
		   return planService.queryForPage(planPage.getFirst()-1, planPage.getPageSize(), orderBy, isAsc);
	   } 
	   
	@RequestMapping(value = "/planList", method = RequestMethod.GET)
	public String list(@RequestParam("pageNo") String pageNo, Map<String, Object> map){
		
		int totalCount = planService.getPlanList().size();
		planPage.setPageNo(pageNo==null?1:Integer.parseInt(pageNo));
		planPage.setTotalCount(totalCount);
		List<Plan> planList = planService.queryForPage(planPage.getFirst()-1, planPage.getPageSize(), orderBy, isAsc);
		map.put("planList", planList);
		session.setAttribute("planPage", planPage);
		return "../../planInfo";
	}

	@RequestMapping(value = "/planAdd", method = RequestMethod.POST)
	public String add(Plan plan, Map<String, Object> map) {
		String message = "";
		plan.setPlanState("进行中");
		planService.addPlan(plan);

		String planProject = plan.getPlanProject();
		List<Plan> plansByProject = planService.getPlanBy("planProject", planProject);
		List<Plan> plansByState = planService.getPlanBy("planProject", planProject,"planState", "完成");
		double process = 0.0;
		if(plansByProject!=null&&plansByProject.size()!=0)
			process = (double)plansByState.size() / (double)plansByProject.size()*100;
		
		List<Project> projects = projectService.getProjectBy("proCode", planProject.substring(planProject.indexOf("(")+1, planProject.indexOf(")")));
		if(projects!=null&&projects.size()!=0){
			Project project = projects.get(0);
			project.setProcess(String.valueOf(process)+"%");
			projectService.updateProject(project);
			System.out.println(project.getProcess());
		}
		
		List<Plan> planLists = pageList();

		map.put("planList", planLists);
		System.out.println(map.get("planList"));
		map.put("message", message);
		planPage.setTotalCount(planService.getPlanList().size());
		session.setAttribute("planPage", planPage);
		return "../../planInfo";
	}
	

	@RequestMapping(value = "/planUpdate", method = RequestMethod.POST)
	public String update(Plan plan, Map<String, Object> map) {
		System.out.println(plan.getId());
		planService.updatePlan(plan);
		List<Plan> planLists = pageList();
		map.put("planList", planLists);
		System.out.println(map.get("planList"));
		return "../../planInfo";
	}
	
	@RequestMapping(value = "/planDeleteCheck", method = RequestMethod.POST)
	public String deleteCheck(String[] planCheck, Map<String, Object> map) {
		for(String planId : planCheck){
			planService.deleteById(planId);
		}
		List<Plan> planLists = pageList();
		map.put("planList", planLists);
		return "../../planInfo";
	}
	
	@RequestMapping(value = "/planDelete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") String id, Map<String, Object> map) {

		System.out.println(id);
		planService.deleteById(id);
		System.out.println(id);
		List<Plan> planLists = pageList();
		map.put("planList", planLists);
		planPage.setTotalCount(planService.getPlanList().size());
		session.setAttribute("planPage", planPage);
		return "../../planInfo";

	}
	
	@RequestMapping(value = "/setState", method = RequestMethod.GET)
	public String setState(@RequestParam("id") String id, @RequestParam("state") String state, Map<String, Object> map) {
		if("完成".equals(state)){
			List<Plan> plans = planService.getPlanBy("id", id);
			if(plans!=null&&plans.size()!=0){
				Plan plan = plans.get(0);
				plan.setPlanState("完成");
				planService.updatePlan(plan);
				String planProject = plan.getPlanProject();
				List<Plan> plansByProject = planService.getPlanBy("planProject", planProject);
				List<Plan> plansByState = planService.getPlanBy("planProject", planProject,"planState", "完成");
				double process = 0.0;
				if(plansByProject!=null&&plansByProject.size()!=0)
					process = (double)plansByState.size() / (double)plansByProject.size()*100;
				System.out.println(planProject.substring(planProject.indexOf("(")+1, planProject.indexOf(")")));
				
				List<Project> projects = projectService.getProjectBy("proCode", planProject.substring(planProject.indexOf("(")+1, planProject.indexOf(")")));
				if(projects!=null&&projects.size()!=0){
					Project project = projects.get(0);
					project.setProcess(String.valueOf(process)+"%");
					projectService.updateProject(project);
				}
			}
		}

		List<Plan> planLists = pageList();
		map.put("planList", planLists);
		planPage.setTotalCount(planService.getPlanList().size());
		session.setAttribute("planPage", planPage);
		return "../../planInfo";
	}
}
