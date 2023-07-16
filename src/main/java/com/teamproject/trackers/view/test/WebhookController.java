package com.teamproject.trackers.view.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;

@RestController
public class WebhookController {
	
	/*
	@RequestMapping(value="/purchase/webhook", method=RequestMethod.POST)
	public void getWebhook(@RequestBody JsonObject jsonObj, HttpServletResponse resp) {
		System.out.println("WebhookController 도착");
		System.out.println(jsonObj);
	}
	*/

}
