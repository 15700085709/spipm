package com.ywx.tiles.account.control;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ywx.tiles.account.entity.Project;
import com.ywx.tiles.account.service.ProjectService;
import com.ywx.tiles.common.support.CrudBaseSupport;
@Controller
@RequestMapping("/project")
public class ProjectControl extends CrudBaseSupport {
	@Autowired
	private ProjectService projectService;
	@RequestMapping("/projectList")
	public String list(Map<String, Object> map) {

		List<Project> projectList = projectService.getProjectList();

		map.put("projectList", projectList);
		return "../../projects";
	}
	@RequestMapping("/projectAdd")
	public String projectAdd(@RequestParam("file") CommonsMultipartFile file) {
		Project project = new Project();
		System.out.println(file.getOriginalFilename());
		project.setProPlan(file.getBytes());
		project.setFileName(file.getOriginalFilename());
		projectService.addProject(project);
		project.getProPlan();
		return "../../projects";
	}

	@RequestMapping("/proPlanDownload")
	public String downloadFile(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {
		List<Project> projectList = projectService.getProjectBy("id", id);
		Project project = projectList.get(0);
                response.setContentType("application/force-download");// 设置强制下载不打开
                response.addHeader("Content-Disposition",
                        "attachment;fileName=" + project.getFileName());// 设置文件名
                try {
                    OutputStream os = response.getOutputStream();                    
                        os.write(project.getProPlan());
                        os.flush();
                        os.close();
                } catch (Exception e) {
                    // TODO: handle exception
                    e.printStackTrace();
                }
            
        
        return null;
    }
}
