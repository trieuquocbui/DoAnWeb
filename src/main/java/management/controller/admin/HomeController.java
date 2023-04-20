package management.controller.admin;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import management.dao.IBillDao;
import management.dao.ICustomerDao;
import management.dao.IStaffDao;


@Controller("abc")
@RequestMapping("/admin/")

public class HomeController {
	@Autowired
	private ICustomerDao customerDao;
	@Autowired
	private IStaffDao staffDao;
	@Autowired
	private IBillDao billDao;
	
	@GetMapping("home")
	public ModelAndView Home(ModelMap model) {
		int countCus=0;
		if(customerDao.getListCustomer()!=null) {
			countCus=customerDao.getListCustomer().size();
		}
		int countStaff=0;
		if(staffDao.getListStaff()!=null) {
			countStaff=staffDao.getListStaff().size();
		}
		long countBill=billDao.getCountBill();
		
		model.addAttribute("countCustomer",countCus);
		model.addAttribute("countStaff",countStaff);
		model.addAttribute("countBill",countBill);
		ModelAndView modelAndView = new ModelAndView("admin/Home");
		return modelAndView;
	}
	
	
	
}
