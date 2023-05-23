package management.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import management.dao.IAccountDao;
import management.dao.ICustomerDao;
import management.dao.IStaffDao;
import management.entity.Account;
import management.entity.Customer;
import management.entity.Role;
import management.entity.Staff;

@Controller
public class AuthController {
	
	@Autowired
	private IAccountDao accountDao;
	@Autowired
	IStaffDao staffDao;
	@Autowired
	ICustomerDao customerDao;
	
	
	public static Account taikhoan=new Account();
	public static Staff nv=new Staff();
	public static Customer kh=new Customer();
	public static String matKhau;
	
	@GetMapping("/login")
	public ModelAndView signin() {
		
		ModelAndView mav = new ModelAndView("auth/login");
		
		return mav;
	}

	@RequestMapping(value = "/login/log",method=RequestMethod.POST)
	public String signin1(ModelMap model,HttpServletRequest request,HttpSession ss) 
			throws NoSuchAlgorithmException
	{
		HttpSession session1 = request.getSession();
		session1.removeAttribute("user");
		String username = request.getParameter("email"); 
		String password = request.getParameter("password");
		username.trim();
		password.trim();
		/*
		 * MessageDigest md = MessageDigest.getInstance("MD5");
		 * md.update(password.getBytes()); byte[] digest = md.digest(); String myHash =
		 * "123";
		 */
		
		
		boolean kt=true;
		//Kiểm tra Email đăng nhập
		if(username.equals("")==true)
		{
			model.addAttribute("errorTK", "Email không được để trống!");
			kt=false;
		}
		
		//Kiểm tra mật khẩu đăng nhập
		if(password.equals("")==true)
		{
			model.addAttribute("errorMK", "Mật khẩu không được để trống!");
			kt=false;
		}

		if(kt==false)
		{
			return "login";
		}
		
		
		Account account=accountDao.getSingleAccount(username, password);
		
		
		if(account==null)
		{
			model.addAttribute("messageA", "Tài khoản hoặc mật khẩu không đúng!");
			//session1.setAttribute("messageA", "Tài khoản hoặc mật khẩu không đúng!");
			model.addAttribute("login","Login");
			return "redirect:/login";
		}
		
		else
			{
					//Kiểm tra mã quyền có phải NHÂN VIÊN không!
					if(account.getRole().getId().trim().equals("NV"))
					{
						taikhoan = account;
						nv = taikhoan.getStaff();
						matKhau = password;
						
						if(nv.getAccount().getStatus()==2) {
							model.addAttribute("messageA","Tài khoản đã quá hạn sử dụng!");
							return "redirect:/login";
							}
						session1.setAttribute("tk",taikhoan);
						session1.setAttribute("user", kh);
						session1.setAttribute("mk", matKhau);
					
					return "redirect:/admin/order";
					}
					
					
					
					//Kiểm tra mã quyên có phải QUẢN LÝ không!
					else if(account.getRole().getId().trim().equals("QL"))
					{
						taikhoan=account;
						nv=taikhoan.getStaff();
						matKhau = password;
						session1.setAttribute("tk",taikhoan);
						session1.setAttribute("user", kh);
						session1.setAttribute("mk", matKhau);
						//model.addAttribute("login", true);
						return "redirect:/admin/home";
					}
					
					//Kiểm tra mã quyên có phải KHÁCH HÀNG không!
					else if(account.getRole().getId().trim().equals("KH"))
					{
						taikhoan = account;
						kh = taikhoan.getCustomer();
						
						matKhau = password;
						
						
						session1.setAttribute("tk",taikhoan);
						session1.setAttribute("user", kh);
						session1.setAttribute("mk", matKhau);
						session1.setAttribute("login", true);
						
						
						
					
						return "redirect:/user/home";
					}
					else
					{
						model.addAttribute("messageA", "Vui lòng đăng nhập lại!");
						model.addAttribute("login","Login");
						return "redirect:/login";
					}
					
					
				}

		
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
