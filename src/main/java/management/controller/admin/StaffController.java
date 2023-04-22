package management.controller.admin;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import management.bean.Message;
import management.dao.IAccountDao;
import management.dao.IStaffDao;
import management.entity.Account;
import management.entity.Role;
import management.entity.Staff;

@Controller
@RequestMapping("/admin/")

public class StaffController {

	@Autowired
	private IStaffDao staffDao;
	@Autowired
	private IAccountDao accountDao;
	
	
	@RequestMapping(value="staff",method = RequestMethod.GET)
	public ModelAndView staff(ModelMap model) {
		List<Staff>list=staffDao.getListStaff();
		System.out.println("hello"+list.size());
		model.addAttribute("listStaff", list);
		
		ModelAndView modelAndView = new ModelAndView("admin/staffs");
		return modelAndView;
	}
	
	@RequestMapping(value = "staff/add", method = RequestMethod.POST)
	public String register(ModelMap model, @ModelAttribute("taikhoan") Account tk, BindingResult errors,
			@RequestParam("tenNV") String tenNV, @RequestParam("cmnd") String cmnd,
			@RequestParam("soDT") String sdt, @RequestParam("diaChi") String diaChi,
			@RequestParam("gioiTinh") Boolean gioiTinh, @RequestParam("ngaySinh") String ngaySinh,
			@RequestParam("role") String chucVu,@RequestParam("anh") String anh,
			
			@RequestParam("email") String email, HttpSession ss, HttpServletRequest request, RedirectAttributes redirectAttributes) throws ParseException, NoSuchAlgorithmException
	{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date ngaySinhDate = formatter.parse(ngaySinh);
		String password = "01234567";
		
		
		
		Account tkhoan = accountDao.checkEmail(email);
		
		
		if (tkhoan != null) {
			errors.rejectValue("email", "taikhoan", "Tài Khoản Đã tồn Tại");
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Thêm mới thất bại do trùng email"));
			return "redirect:/admin/staff";
		}
		
			
		
		try {
			Role r = new Role();
			r.setId(chucVu);
			tk.setRole(r);
			tk.setStatus(1);
			tk.setEmail(email);
			tk.setPassword(password);

			model.addAttribute("taikhoan", new Account());
			Staff nv = new Staff();

			
			nv.setAccount(tk);
			nv.setName(tenNV);
			nv.setAddress(diaChi);

			nv.setGender(gioiTinh ? true : false);

			nv.setPhoneNumber(sdt);
			nv.setDateOfBirth(ngaySinhDate);
			nv.setcMND(cmnd);
			nv.setImage(anh);
			nv.setAccount(tk);

			staffDao.addStaff(nv, tk);

			redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm mới thành công"));
			System.out.println("Thanh cong");

			return "redirect:/admin/staff";

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Thất bại thêm tài khoản");
			redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm mới thất bại"));
			System.out.println("Thất bại thêm nhân viên3");
			return "redirect:/admin/staff/add";

		}
			
		
	}
	
	@RequestMapping(value = "staff/update", method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("taikhoan") Account tk, BindingResult errors,
			@RequestParam("tenNV") String tenNV, @RequestParam("cmnd") String cmnd,
			@RequestParam("soDT") String sdt, @RequestParam("diaChi") String diaChi,
			@RequestParam("gioiTinh") Boolean gioiTinh, @RequestParam("ngaySinh") String ngaySinh,
			@RequestParam("role") String chucVu,@RequestParam("anh1") String anh,
			@RequestParam("trangThai") Integer trangThai,
			@RequestParam("email") String email,
			
			HttpSession ss, HttpServletRequest request, RedirectAttributes redirectAttributes) throws ParseException, NoSuchAlgorithmException
	{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date ngaySinhDate = formatter.parse(ngaySinh);
		
		
		System.out.println("hello cd");
		System.out.println("hello");
		
		
		
			
		
		try {
			
			tk.setStatus(trangThai);
			tk.setEmail(email);
	
			Staff nv = new Staff();

			//nv.setId(staffDao.getStaff(email).getId());
			//System.out.println(nv.getId());
			nv.setAccount(tk);
			nv.setName(tenNV);
			nv.setAddress(diaChi);

			nv.setGender(gioiTinh ? true : false);

			nv.setPhoneNumber(sdt);
			nv.setDateOfBirth(ngaySinhDate);
			nv.setcMND(cmnd);
			nv.setImage(anh);
		//	nv.setId(staffDao.getId(email));
			//staffDao.updateStaff(nv,tk);
			//hello

			redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm mới thành công"));
			System.out.println("Thanh cong cap nhat");

			return "redirect:/admin/staff";

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Thất bại thêm tài khoản");
			redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm mới thất bại"));
			System.out.println("Thất bại thêm nhân viên3");
			return "redirect:/admin/staff/update";

		}
			
		
	}
	
}
	
	

	
