package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;


import lombok.extern.log4j.Log4j;
import oracle.net.ano.Service;

@WebAppConfiguration // ServletContext를 이용하기 위해
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class BoardControllerTests { // BoardController 호출해서 서버 구동하지 않고 해결

	@Autowired
	private WebApplicationContext ctx;
	// mock 가상의 웹 환경을 만들어서 test
	private MockMvc mockMvc;

	@Before

	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();

	}

	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title","널 떠올리는 중이야")
				.param("content","너에겐 나 부족한 사람")
				.param("writer","파테코")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
				
	}
	@Test
	public void testGet() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/board/get")
				.param("bno","201822"))
		.andReturn()
		.getModelAndView().getModelMap());
	}
	
	@Test
	public void testListPaging() throws Exception {
		
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "2")
				.param("amount", "50"))
				.andReturn().getModelAndView().getModelMap());
				
	}
	
	@Test
	public void testRemove() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("b_seq", "496"))
				.andReturn()
				.getModelAndView().getModelMap()
				
				);
	}
}