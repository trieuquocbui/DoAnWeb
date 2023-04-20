package management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import management.dao.IAccountDao;
import management.entity.Account;
import management.entity.Customer;
import management.entity.Role;

@Controller
public class AuthController {
	
	@Autowired
	private IAccountDao accountDao;
	
	@GetMapping("/login")
	public ModelAndView signin() {
		
		ModelAndView mav = new ModelAndView("auth/login");
		
		return mav;
	}
	
	@GetMapping("/register")
	public ModelAndView signup() {
		
		ModelAndView mav = new ModelAndView("auth/register");
		
		Account account = new Account();
		
		Customer customer = new Customer();
		
		account.setCustomer(customer);
		
		mav.addObject("userForm", account);
		
		mav.addObject("check", false);
		
		return mav;
	}
	
	@PostMapping("/register")
	public ModelAndView registerCustomer(@ModelAttribute("userForm") Account userForm,@RequestParam("passwordConfirm") String password) {
		
		ModelAndView mav = new ModelAndView("auth/register");
		
		String message = "";
		
		mav.addObject("check", true);
		
		mav.addObject("checkPassword", false);
		
		// validation account test
		
		if ( !password.equals(userForm.getPassword())) {
			mav.addObject("checkPassword", true);
			mav.addObject("error", "confirm password fail");
			message = "Đăng kí thất bại";
			mav.addObject("message", message);
			return mav;
		}
		
		accountDao.createAccountOfCustomer(userForm);
		
		message = "Đăng kí thành công";
		
		mav.addObject("message", message);
		
		return mav;
		
	}
}
