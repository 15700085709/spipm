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

import com.spipm.core.orm.Page;
import com.spipm.tiles.account.entity.Report;
import com.spipm.tiles.account.service.ReportService;
import com.spipm.tiles.common.support.CrudBaseSupport;
@Controller
@RequestMapping("/report")
public class ReportControl extends CrudBaseSupport {
	@Autowired
	private ReportService reportService;
	private  HttpServletRequest request;
	private  HttpServletResponse response;
	private HttpSession session;
	private int reportIdCount = 0;
	private String orderBy;
	private boolean isAsc;
	private Page<Report> reportPage = new Page<Report>(1,10);
	   @ModelAttribute

	   public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

	       this.request = request;

	       this.response = response;

	       this.session = request.getSession();

	   }


	   public List<Report> pageList(){
		   return reportService.queryForPage(reportPage.getFirst()-1, reportPage.getPageSize(), orderBy, isAsc);
	   } 
	   
	@RequestMapping(value = "/reportList", method = RequestMethod.GET)
	public String list(@RequestParam("pageNo") String pageNo, Map<String, Object> map){
		
		int totalCount = reportService.getReportList().size();
		reportPage.setPageNo(pageNo==null?1:Integer.parseInt(pageNo));
		reportPage.setTotalCount(totalCount);
		List<Report> reportList = reportService.queryForPage(reportPage.getFirst()-1, reportPage.getPageSize(), orderBy, isAsc);
		map.put("reportList", reportList);
		session.setAttribute("reportPage", reportPage);
		return "../../reportInfo";
	}

	@RequestMapping(value = "/reportAdd", method = RequestMethod.POST)
	public String add(Report report, Map<String, Object> map) {
		String message = "";
		reportService.addReport(report);
		List<Report> reportLists = pageList();

		map.put("reportList", reportLists);
		System.out.println(map.get("reportList"));
		map.put("message", message);
		reportPage.setTotalCount(reportService.getReportList().size());
		session.setAttribute("reportPage", reportPage);
		return "../../reportInfo";
	}
	@RequestMapping(value = "/reportAppendContent", method = RequestMethod.POST)
	public String appendContent(@RequestParam("id") String id, @RequestParam("appendDate") String appendDate,
				@RequestParam("appendUser") String appendUser, @RequestParam("appendContent") String appendContent, Map<String, Object> map) {

		List<Report> reportAppend = reportService.getReportBy("id", id);
		if(reportAppend!=null&&reportAppend.size()>0){
			Report ra = reportAppend.get(0);
			String newAppendContent = ra.getAppendContent();
			newAppendContent +=appendContent+"\n\t\t\t"+appendUser+"\t"+appendDate+"\n\n";
			ra.setAppendContent(newAppendContent);
			reportService.updateReport(ra);
			List<Report> reportLists = pageList();
			map.put("reportList", reportLists);
		}
		return "../../reportInfo";
	}
	
	@RequestMapping(value = "/reportOrder", method = RequestMethod.GET)
	public String order(String orderBy, Map<String, Object> map) {
		this.orderBy = orderBy;
		if((reportIdCount++)%2 != 0)
			isAsc = true;
		else
			isAsc = false;
		List<Report> reportLists = pageList();
		map.put("reportList", reportLists);
		System.out.println(orderBy+ isAsc);
		return "../../reportInfo";
	}
	
	
	
	@RequestMapping(value = "/reportUpdate", method = RequestMethod.POST)
	public String update(Report report, Map<String, Object> map) {
		System.out.println(report.getId());
		reportService.updateReport(report);
		List<Report> reportLists = pageList();
		map.put("reportList", reportLists);
		System.out.println(map.get("reportList"));
		return "../../reportInfo";
	}
	
	@RequestMapping(value = "/reportDeleteCheck", method = RequestMethod.POST)
	public String deleteCheck(String[] reportCheck, Map<String, Object> map) {
		for(String reportId : reportCheck){
			reportService.deleteById(reportId);
		}
		List<Report> reportLists = pageList();
		map.put("reportList", reportLists);
		return "../../reportInfo";
	}
	
	@RequestMapping(value = "/reportDelete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") String id, Map<String, Object> map) {

		System.out.println(id);
		reportService.deleteById(id);
		System.out.println(id);
		List<Report> reportLists = pageList();
		map.put("reportList", reportLists);
		reportPage.setTotalCount(reportService.getReportList().size());
		session.setAttribute("reportPage", reportPage);
		return "../../reportInfo";

	}
}
