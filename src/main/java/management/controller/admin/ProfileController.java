package management.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import management.dao.IProfileAdminDao;
import management.entity.Account;
import management.entity.Staff;

@Controller
@RequestMapping("/admin/")
public class ProfileController {
	@Autowired
	private IProfileAdminDao profileAdminDao;

	@RequestMapping(value = "profile/Edit", method = RequestMethod.POST)
	public String editNV(HttpServletRequest request, @ModelAttribute("taikhoan") Account tk,BindingResult result, ModelMap model)
			throws ParseException {
//		HttpSession session = request.getSession();
//		String email = (String) session.getAttribute("emailTK");

		try {
			String honv = request.getParameter("ho");
			String tennv = request.getParameter("ten");
			String ngaysinhnv = request.getParameter("ngaysinh");
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			Date ngaysinhDate = fmt.parse(ngaysinhnv);
			String sdtnv = request.getParameter("sdt");
//			boolean gioitinhnv = Boolean.parseBoolean(request.getParameter("gioitinh"));
			String diachinv = request.getParameter("diachi");
			String hinhanhnv = request.getParameter("hinhanh");
			String emailnv = request.getParameter("email");
			String password = request.getParameter("password");
			String cmndnv = request.getParameter("cmnd");
			String chucvunv = request.getParameter("role");
			
			Staff staff = profileAdminDao.getStaffByEmail("nghia@gmail.com");
	        // Kiểm tra họ tên (họ tên không được chứa ký tự đặc biệt và số)
	        if (!staff.getSurname().matches("^[a-zA-Z\\s]+$")) {
	        	result.rejectValue("surname", "Invalid.hoten", "Họ không hợp lệ.");
	        }        
	        if (!staff.getName().matches("^[a-zA-Z\\s]+$")) {
	        	result.rejectValue("name", "Invalid.hoten", "Tên không hợp lệ.");
	        }
	        
	        // Kiểm tra ngày sinh (nhỏ hơn ngày hiện tại và đủ 18 tuổi)
	        Date dateOfBirth = staff.getDateOfBirth();
	        LocalDate ngaySinh = dateOfBirth.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	        LocalDate currentDate = LocalDate.now();
	        LocalDate eighteenYearsAgo = currentDate.minusYears(18);
	        
	        if (ngaySinh.isAfter(currentDate) || ngaySinh.isAfter(eighteenYearsAgo)) {
	        	result.rejectValue("dateOfBirth", "Invalid.ngaysinh", "Ngày sinh không hợp lệ.");
	        }
	        
	        // Kiểm tra số điện thoại (số điện thoại gồm 10 chữ số)
	        if (!staff.getPhoneNumber().matches("^\\d{10}$")) {
	        	result.rejectValue("phoneNumber", "Invalid.sdt", "Số điện thoại không hợp lệ."); 
	        }
	        
	        // Kiểm tra địa chỉ email (địa chỉ email phải đúng định dạng)
	        if (!staff.getAccount().getEmail().matches("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")) {
	        	result.rejectValue("account.email", "Invalid.EMAIL", "Địa chỉ email không hợp lệ."); 
	        }
	        
	        // Kiểm tra chứng minh nhân dân (chứng minh nhân dân gồm 10 chữ số)
	        if (!staff.getcMND().matches("^\\d{10}$")) {
	        	result.rejectValue("cMND", "Invalid.cmnd", "CMND không hợp lệ.");
	        }
	        
	        if (result.hasErrors()) {
		    	List<FieldError> errors = result.getFieldErrors();
		    	for (FieldError error : errors) {
		    	    System.out.println("Field: " + error.getField());
		    	}
		    	model.addAttribute("staff", staff);
		    	model.addAttribute("errorMessage", errors);
		    	return "admin/profile";
		    }

//			Role r = new Role();
//			r.setId("NV");
//			tk.setRole(r);
			tk.setStatus(1);
			tk.setEmail(emailnv);
			tk.setPassword(password);
			

			staff.setAccount(tk);
			staff.setSurname(honv);
			staff.setName(tennv);
			staff.setAddress(diachinv);
//			staff.setGender(gioitinhnv);
			staff.setPhoneNumber(sdtnv);
			staff.setDateOfBirth(ngaysinhDate);
			staff.setcMND(cmndnv);
			staff.setImage(hinhanhnv);
			staff.setAccount(tk);

			Integer temp = profileAdminDao.updateStaff(staff, tk);

			if (temp != 0) {
				model.addAttribute("successMessage", "Update thành công!");
			} else {
				model.addAttribute("errorMessage", "Update thất bại!");
			}
			model.addAttribute("staff", staff);
		} catch (Exception e) {
			Staff staff = profileAdminDao.getStaffByEmail("nghia@gmail.com");
			model.addAttribute("staff", staff);
			model.addAttribute("errorMessage", "Update thất bại!");
			return "admin/profile";

		}
		return "admin/profile";
	}

	@GetMapping("profile")
	public ModelAndView LoadTTCaNhan(HttpServletRequest request, ModelMap model) {
		
//		HttpSession session = request.getSession();
//		String email = (String) session.getAttribute("emailTK");
		Staff staff = profileAdminDao.getStaffByEmail("nghia@gmail.com");
		model.addAttribute("staff", staff);
		ModelAndView modelAndView = new ModelAndView("admin/profile");

		return modelAndView;
	}
}
