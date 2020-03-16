package com.zeng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("home")
public class DemoController {

	
	@RequestMapping(value="upload")
	public String upload() {
	    return "upload";
    }
}
