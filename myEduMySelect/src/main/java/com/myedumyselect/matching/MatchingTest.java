package com.myedumyselect.matching;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MatchingTest {
	
	@GetMapping("/matchingTest")
	public String matchingTest() {
		return "matching/matchingMain"; 
	}
	
	@GetMapping("/matchingTest2")
	public String matchingTest2() {
		return "matching/matchingBoardList"; 
	}
	
	@GetMapping("/matchingTest3")
	public String matchingTest3() {
		return "matching/matchingDetail"; 
	}

}
