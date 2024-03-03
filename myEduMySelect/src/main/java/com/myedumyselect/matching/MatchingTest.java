package com.myedumyselect.matching;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MatchingTest {
	
	@GetMapping("/matchingTest")
	public String matchingTest() {
		return "matching/matchingMain"; 
	}

}
