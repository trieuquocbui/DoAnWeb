package management.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("")
@RequestMapping("/admin/")
public class DashBoardController {
	@GetMapping("dashboard")
	public ModelAndView dashboard() {
		ModelAndView modelAndView = new ModelAndView("admin/dashboard");
		return modelAndView;
	}
}
