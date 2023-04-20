package management.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import management.dao.ICustomerDao;
import management.dao.impl.CustomerDaoImpl;
import management.entity.Customer;

@Controller
@RequestMapping("/admin")
public class CustomerController {
	@Autowired
	private ICustomerDao iCustomerDao;
	

	
	// Trả về view: DSKH
	@RequestMapping("listcustomer")
	public ModelAndView getList_Customer()
	{	
		ModelAndView modelAndView = new ModelAndView("admin/list_Customer");
		modelAndView.addObject("customers",iCustomerDao.getListCustomer());
		return modelAndView;
		
	}
}
