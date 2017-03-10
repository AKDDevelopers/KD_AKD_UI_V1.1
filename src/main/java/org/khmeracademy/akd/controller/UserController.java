package org.khmeracademy.akd.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;


@Controller
public class UserController {
	
	@Autowired
	private String LOGIN_URL;
	
	@Autowired
	private String REGISTER_URL;
	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private HttpHeaders header;

	
	@RequestMapping(value={"/","/documents"},method=RequestMethod.GET)
	public String index(){
		return "index2";
	}
	
	@RequestMapping(value="/feature/{filter}", method=RequestMethod.GET)
	public String feature(@PathVariable("filter") String filter, ModelMap model){
		//System.out.println("ID==>" + id);
		model.put("filter", filter);
		return "user/feature";
	}
	
	@RequestMapping(value="/search/{title}",method=RequestMethod.GET)
	public String search(@PathVariable("title") String title, ModelMap model){
		model.put("title", title);
		return "user/result-search";
	}
	
	
	@RequestMapping(value="/userAccount",method=RequestMethod.GET)
	public String user(){
		return "user/user";
	}
	
	@RequestMapping(value="/detail/{id}", method=RequestMethod.GET)
	public String detail(@PathVariable("id") String id, ModelMap model){
		//System.out.println("ID==>" + id);
		model.put("id", id);
		return "user/details";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
		return new ModelAndView("redirect:" + LOGIN_URL);
    }
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register() {
		return new ModelAndView("redirect:" + REGISTER_URL);
    }
	
	@RequestMapping(value="/cat/{ParentID}",method=RequestMethod.GET)
	public String viewPageByCategory(@PathVariable("ParentID") String ParentID, ModelMap model,@RequestParam("p") String menuName){
		model.put("ParentID", ParentID);
		model.put("PAGE_TITLE", menuName);
		return "user/view-by-category";
	}

	// search result
	@RequestMapping(value="/searchResult",method = RequestMethod.GET)
	public String searchResult(@RequestParam("keyword") String keyword, ModelMap model){
		//System.out.println("ID==>" + id);
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = restTemplate.exchange("http://docs-api.khmeracademy.org/api/v1/get-documents-by-doc-title-or-cat-id", HttpMethod.GET, request , Map.class) ;
		System.out.print("RESPONSE BODY=> "+response.getBody().get("DATA"));


		model.put("keyword", keyword);
	//	model.put("RESULTS",response.getBody().get("DATA"));
    // return search page
		return "search";
	}





}

