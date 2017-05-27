package com.ywx.tiles.account.control;

import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Date;
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
import com.ywx.tiles.account.entity.Deployment;
import com.ywx.tiles.account.service.DplService;
import com.ywx.tiles.account.service.ProjectService;
import com.ywx.tiles.account.service.UserService;

@Controller
@RequestMapping("/dpl")
public class DplControl {
	@Autowired
	private DplService dplService;	
	@Autowired
	private UserService userService;
	@Autowired
	private ProjectService projectService;
	private  HttpServletRequest request;
	private  HttpServletResponse response;
	private HttpSession session;
	private int maxVersion=1;
	private int dplCodeCount = 0;
	private String orderBy;
	private boolean isAsc;
	private Page<Deployment> dplPage = new Page<Deployment>(1,10);
	   @ModelAttribute

	   public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

	       this.request = request;

	       this.response = response;

	       this.session = request.getSession();

	   }
	
	   public List<Deployment> pageList(){
		   return dplService.queryForPage(dplPage.getFirst()-1, dplPage.getPageSize(), orderBy, isAsc);
	   } 
	   
		@RequestMapping(value = "/dplList", method = RequestMethod.GET)
		public String list(@RequestParam("pageNo") String pageNo, Map<String, Object> map){
			maxVersion = dplService.getMaxVersion()+1;
			session.setAttribute("maxVersion", maxVersion);
			System.out.println(dplService.getMaxVersion());
			dplPage.setPageNo(pageNo==null?1:Integer.parseInt(pageNo));
			dplPage.setTotalCount(dplService.getDplList().size());
			List<Deployment> dplList = dplService.queryForPage(dplPage.getFirst()-1, dplPage.getPageSize(), orderBy, isAsc);
			map.put("dplList", dplList);
			session.setAttribute("dplPage", dplPage);
			for(Deployment dpl : dplList){
				System.out.println(dpl.getDplVersion());
			}
			return "../../dplInfo";
		}  

	@RequestMapping(value = "/dplDelete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") String id, Map<String, Object> map) {

		System.out.println(id);
		dplService.deleteById(id);
		System.out.println(id);
		List<Deployment> dplLists = pageList();
		map.put("dplList", dplLists);
		dplPage.setTotalCount(dplService.getDplList().size());
		session.setAttribute("dplPage", dplPage);
		return "../../dplInfo";

	}
	@RequestMapping(value = "/dplUpdate", method = RequestMethod.POST)
	public String update(Deployment dpl, Map<String, Object> map) {
		System.out.println(dpl.getId());
		dplService.updateDpl(dpl);
		List<Deployment> dplLists = pageList();
		map.put("dplList", dplLists);
		System.out.println(map.get("dplList"));
		return "../../dplInfo";
	}
	
	
	@RequestMapping(value = "/dplDownload", method = RequestMethod.GET)
	public String dplDownload(@RequestParam("suffix") String suffix, @RequestParam("id") String id) {
		List<Deployment> dpls = dplService.getDplBy("id", id);
		if(dpls!=null&&dpls.size()!=0){
			Deployment dpl = dpls.get(0);
			byte[] b = null;
			String fileNmae = null;
			if("war".equals(suffix.toLowerCase())){
				b = dpl.getDplWar();
				fileNmae = new Date().getTime()+".war";
			}else if("sql".equals(suffix.toLowerCase())){
				b = dpl.getDplSql();
				fileNmae = new Date().getTime()+".sql";
			}
			response.setContentType("application/force-download");// 设置强制下载不打开
            response.addHeader("Content-Disposition",
                    "attachment;fileName=" + fileNmae);// 设置文件名
            try {
                OutputStream os = response.getOutputStream();                    
                    os.write(b);
                    os.flush();
                    os.close();
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }
		}
		return null;
	}
	@RequestMapping(value = "/dplAdd", method = RequestMethod.POST)
	public String add(Deployment dpl, Map<String, Object> map) {
		dpl.setDplState("创建");
		dpl.setCreateTime(new Timestamp(new Date().getTime()));
		dplService.addDpl(dpl);
		List<Deployment> dplLists = pageList();

		maxVersion = dplService.getMaxVersion()+1;
		session.setAttribute("maxVersion", maxVersion);
		map.put("dplList", dplLists);
		dplPage.setTotalCount(dplService.getDplList().size());
		session.setAttribute("dplPage", dplPage);
		return "../../dplInfo";
	}
	
	@RequestMapping(value = "/dplOrder", method = RequestMethod.GET)
	public String order(String orderBy, Map<String, Object> map) {
		this.orderBy = orderBy;
		if((dplCodeCount++)%2 != 0)
			isAsc = true;
		else
			isAsc = false;
		List<Deployment> dplLists = pageList();
		map.put("dplList", dplLists);
		System.out.println(orderBy+ isAsc);
		return "../../dplInfo";
	}
	
	@RequestMapping(value = "/dplDeleteCheck", method = RequestMethod.POST)
	public String deleteCheck(String[] dplCheck, Map<String, Object> map) {
		for(String dplId : dplCheck){
			dplService.deleteById(dplId);
		}
		List<Deployment> dplLists = pageList();
		map.put("dplList", dplLists);
		return "../../dplInfo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAllProject", method = RequestMethod.POST)
	public Map<String, Object> getAllProject(){
		Map<String, Object> allProjects  = new HashMap<String, Object>();
		allProjects.put("projects",projectService.getProjectList());
		return allProjects;
	}
}
