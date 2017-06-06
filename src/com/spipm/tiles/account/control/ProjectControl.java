package com.spipm.tiles.account.control;

import java.io.OutputStream;
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
import com.spipm.tiles.account.entity.Project;
import com.spipm.tiles.account.service.ProjectService;
import com.spipm.tiles.common.support.CrudBaseSupport;
@Controller
@RequestMapping("/project")
public class ProjectControl extends CrudBaseSupport {
	@Autowired
	private ProjectService projectService;
	private  HttpServletRequest request;
	private  HttpServletResponse response;
	private HttpSession session;
	private int projectIdCount = 0;
	private String orderBy;
	private boolean isAsc;
	private Page<Project> projectPage = new Page<Project>(1,10);
	   @ModelAttribute

	   public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

	       this.request = request;

	       this.response = response;

	       this.session = request.getSession();

	   }
	@RequestMapping(value="/json", method = RequestMethod.GET)  
    public @ResponseBody List<Project> getShopInJSON() {  
  
		List<Project> projectList = projectService.getProjectList();
          
        return projectList;  
  
    }  
	
	
	   public List<Project> pageList(){
		   return projectService.queryForPage(projectPage.getFirst()-1, projectPage.getPageSize(), orderBy, isAsc);
	   } 
	   
	@RequestMapping(value = "/projectList", method = RequestMethod.GET)
	public String list(@RequestParam("pageNo") String pageNo, Map<String, Object> map){
		
		int totalCount = projectService.getProjectList().size();
		projectPage.setPageNo(pageNo==null?1:Integer.parseInt(pageNo));
		projectPage.setTotalCount(totalCount);
		List<Project> projectList = projectService.queryForPage(projectPage.getFirst()-1, projectPage.getPageSize(), orderBy, isAsc);
		map.put("projectList", projectList);
		session.setAttribute("projectPage", projectPage);
		for(Project project : projectList){
			System.out.println(project.getProCode());
		}
		return "../../proInfo";
	}

	@RequestMapping(value = "/projectAdd", method = RequestMethod.POST)
	public String add(Project project, Map<String, Object> map) {
		String message = "";
		List<Project> projectList = projectService.getProjectBy("proCode", project.getProCode());
		if(projectList.size()==0){
			projectService.addProject(project);
			try
			{
				message = "添加项目信息成功！";
			}catch(Exception e){
				message = "添加项目信息失败！";
			}

		}else{
			message = "该项目代码已存在！";
		}
		List<Project> projectLists = pageList();

		map.put("projectList", projectLists);
		System.out.println(map.get("projectList"));
		map.put("message", message);
		projectPage.setTotalCount(projectService.getProjectList().size());
		session.setAttribute("projectPage", projectPage);
		return "../../proInfo";
	}
	

	@RequestMapping(value = "/projectUpdate", method = RequestMethod.POST)
	public String update(Project project, Map<String, Object> map) {
		System.out.println(project.getId());
		projectService.updateProject(project);
		List<Project> projectLists = pageList();
		map.put("projectList", projectLists);
		System.out.println(map.get("projectList"));
		return "../../proInfo";
	}
	
	@RequestMapping(value = "/projectDeleteCheck", method = RequestMethod.POST)
	public String deleteCheck(String[] projectCheck, Map<String, Object> map) {
		for(String projectId : projectCheck){
			projectService.deleteById(projectId);
		}
		List<Project> projectLists = pageList();
		map.put("projectList", projectLists);
		return "../../proInfo";
	}
	
	@RequestMapping(value = "/projectDelete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") String id, Map<String, Object> map) {

		System.out.println(id);
		projectService.deleteById(id);
		System.out.println(id);
		List<Project> projectLists = pageList();
		map.put("projectList", projectLists);
		projectPage.setTotalCount(projectService.getProjectList().size());
		session.setAttribute("projectPage", projectPage);
		return "../../proInfo";

	}
}
