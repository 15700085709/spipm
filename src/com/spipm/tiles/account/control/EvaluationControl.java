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
import com.spipm.tiles.account.entity.Evaluation;
import com.spipm.tiles.account.service.EvaluationService;
import com.spipm.tiles.common.support.CrudBaseSupport;
@Controller
@RequestMapping("/evaluation")
public class EvaluationControl extends CrudBaseSupport {
	@Autowired
	private EvaluationService evaluationService;
	private  HttpServletRequest request;
	private  HttpServletResponse response;
	private HttpSession session;
	private int evaluationIdCount = 0;
	private String orderBy;
	private boolean isAsc;
	private Page<Evaluation> evaluationPage = new Page<Evaluation>(1,10);
	   @ModelAttribute

	   public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

	       this.request = request;

	       this.response = response;

	       this.session = request.getSession();

	   }
	@RequestMapping(value="/json", method = RequestMethod.GET)  
    public @ResponseBody List<Evaluation> getShopInJSON() {  
  
		List<Evaluation> evaluationList = evaluationService.getEvaluationList();
          
        return evaluationList;  
  
    }  
	
	
	   public List<Evaluation> pageList(){
		   return evaluationService.queryForPage(evaluationPage.getFirst()-1, evaluationPage.getPageSize(), orderBy, isAsc);
	   } 
	   
	@RequestMapping(value = "/evaluationList", method = RequestMethod.GET)
	public String list(@RequestParam("pageNo") String pageNo, Map<String, Object> map){
		
		int totalCount = evaluationService.getEvaluationList().size();
		evaluationPage.setPageNo(pageNo==null?1:Integer.parseInt(pageNo));
		evaluationPage.setTotalCount(totalCount);
		List<Evaluation> evaluationList = evaluationService.queryForPage(evaluationPage.getFirst()-1, evaluationPage.getPageSize(), orderBy, isAsc);
		map.put("evaluationList", evaluationList);
		session.setAttribute("evaluationPage", evaluationPage);
		return "../../evaluationInfo";
	}

	@RequestMapping(value = "/evaluationAdd", method = RequestMethod.POST)
	public String add(Evaluation evaluation, Map<String, Object> map) {
		String message = "";

		evaluationService.addEvaluation(evaluation);
		
		List<Evaluation> evaluationLists = pageList();

		map.put("evaluationList", evaluationLists);
		System.out.println(map.get("evaluationList"));
		map.put("message", message);
		evaluationPage.setTotalCount(evaluationService.getEvaluationList().size());
		session.setAttribute("evaluationPage", evaluationPage);
		return "../../evaluationInfo";
	}
	

	@RequestMapping(value = "/evaluationUpdate", method = RequestMethod.POST)
	public String update(Evaluation evaluation, Map<String, Object> map) {
		System.out.println(evaluation.getId());
		evaluationService.updateEvaluation(evaluation);
		List<Evaluation> evaluationLists = pageList();
		map.put("evaluationList", evaluationLists);
		System.out.println(map.get("evaluationList"));
		return "../../evaluationInfo";
	}
	
	@RequestMapping(value = "/evaluationDeleteCheck", method = RequestMethod.POST)
	public String deleteCheck(String[] evaluationCheck, Map<String, Object> map) {
		for(String evaluationId : evaluationCheck){
			evaluationService.deleteById(evaluationId);
		}
		List<Evaluation> evaluationLists = pageList();
		map.put("evaluationList", evaluationLists);
		return "../../evaluationInfo";
	}
	
	@RequestMapping(value = "/evaluationDelete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") String id, Map<String, Object> map) {

		System.out.println(id);
		evaluationService.deleteById(id);
		System.out.println(id);
		List<Evaluation> evaluationLists = pageList();
		map.put("evaluationList", evaluationLists);
		evaluationPage.setTotalCount(evaluationService.getEvaluationList().size());
		session.setAttribute("evaluationPage", evaluationPage);
		return "../../evaluationInfo";

	}
}
