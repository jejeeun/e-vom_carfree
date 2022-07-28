package kr.co.ejsoft.cims;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


import kr.co.ejsoft.cims.common.util.LogUtil;

import kr.co.ejsoft.cims.system.service.SystemService;

/**
 * User: Naeyoung Kim
 * Date: 2018-11-11
 */
@Controller
public class MainController {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    
    @Autowired
    private SystemService systemService;

    @Autowired
    private ObjectMapper objectMapper;
	
	@Resource(name = "properties")
	private Properties properties;

	@RequestMapping(path = "")
	public String main(Model model) throws JsonProcessingException {

        
		return "main";
	}
	


}
