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

import com.spipm.core.orm.Page;
import com.spipm.tiles.account.entity.Feedback;
import com.spipm.tiles.account.service.FeedbackService;
import com.spipm.tiles.common.support.CrudBaseSupport;
@Controller
@RequestMapping("/feedback")
public class FeedbackControl extends CrudBaseSupport {
	@Autowired
	private FeedbackService feedbackService;
	private  HttpServletRequest request;
	private  HttpServletResponse response;
	private HttpSession session;
	private int feedbackIdCount = 0;
	private String orderBy;
	private boolean isAsc;
	private Page<Feedback> feedbackPage = new Page<Feedback>(1,10);
	   @ModelAttribute

	   public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

	       this.request = request;

	       this.response = response;

	       this.session = request.getSession();

	   }
	@RequestMapping(value="/json", method = RequestMethod.GET)  
    public @ResponseBody List<Feedback> getShopInJSON() {  
  
		List<Feedback> feedbackList = feedbackService.getFeedbackList();
          
        return feedbackList;  
  
    }  
	
	
	   public List<Feedback> pageList(){
		   return feedbackService.queryForPage(feedbackPage.getFirst()-1, feedbackPage.getPageSize(), orderBy, isAsc);
	   } 
	   
	@RequestMapping(value = "/feedbackList", method = RequestMethod.GET)
	public String list(@RequestParam("pageNo") String pageNo, Map<String, Object> map){
		
		int totalCount = feedbackService.getFeedbackList().size();
		feedbackPage.setPageNo(pageNo==null?1:Integer.parseInt(pageNo));
		feedbackPage.setTotalCount(totalCount);
		List<Feedback> feedbackList = feedbackService.queryForPage(feedbackPage.getFirst()-1, feedbackPage.getPageSize(), orderBy, isAsc);
		map.put("feedbackList", feedbackList);
		session.setAttribute("feedbackPage", feedbackPage);
		return "../../feedbackInfo";
	}

	@RequestMapping(value = "/feedbackAdd", method = RequestMethod.POST)
	public String add(Feedback feedback, Map<String, Object> map) {
		String message = "";

		feedbackService.addFeedback(feedback);
		
		List<Feedback> feedbackLists = pageList();

		map.put("feedbackList", feedbackLists);
		System.out.println(map.get("feedbackList"));
		map.put("message", message);
		feedbackPage.setTotalCount(feedbackService.getFeedbackList().size());
		session.setAttribute("feedbackPage", feedbackPage);
		return "../../feedbackInfo";
	}
	

	@RequestMapping(value = "/feedbackUpdate", method = RequestMethod.POST)
	public String update(Feedback feedback, Map<String, Object> map) {
		System.out.println(feedback.getId());
		feedbackService.updateFeedback(feedback);
		List<Feedback> feedbackLists = pageList();
		map.put("feedbackList", feedbackLists);
		System.out.println(map.get("feedbackList"));
		return "../../feedbackInfo";
	}
	
	@RequestMapping(value = "/feedbackDeleteCheck", method = RequestMethod.POST)
	public String deleteCheck(String[] feedbackCheck, Map<String, Object> map) {
		for(String feedbackId : feedbackCheck){
			feedbackService.deleteById(feedbackId);
		}
		List<Feedback> feedbackLists = pageList();
		map.put("feedbackList", feedbackLists);
		return "../../feedbackInfo";
	}
	
	@RequestMapping(value = "/feedbackDelete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") String id, Map<String, Object> map) {

		System.out.println(id);
		feedbackService.deleteById(id);
		System.out.println(id);
		List<Feedback> feedbackLists = pageList();
		map.put("feedbackList", feedbackLists);
		feedbackPage.setTotalCount(feedbackService.getFeedbackList().size());
		session.setAttribute("feedbackPage", feedbackPage);
		return "../../feedbackInfo";

	}
}
