package management.controller.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import management.dao.IBillDao;
import management.entity.Bill;





@Controller
@Transactional
@RequestMapping("/admin/")

public class OrderController {

	@Autowired
	private IBillDao billDao;
	@Autowired
	SessionFactory sessionFactory;
	
	
	
	
	@GetMapping("order")
	public ModelAndView bills(ModelMap model) {
		List<Bill>list0=billDao.getListBillTT(0);
		List<Bill>list1=billDao.getListBillTT(1);
		List<Bill>list2=billDao.getListBillTT(2);
		
		
		model.addAttribute("listBill0", list0);
		model.addAttribute("listBill1", list1);
		model.addAttribute("listBill2", list2);
		
		ModelAndView modelAndView = new ModelAndView("admin/order");
		return modelAndView;
	}
	

	@RequestMapping(value = "order/update", method = RequestMethod.POST)
	public String updateBill(ModelMap model,
			@ModelAttribute("billUpdate") Bill bill,
			@RequestParam("maDonHang") String maDonHang,
			@RequestParam("trangThai") String status,HttpServletRequest request,RedirectAttributes redirectAttributes ) {
			System.out.println("heloo0990");
			try {
				
				billDao.updateStatus(Integer.parseInt(maDonHang), Integer.parseInt(status));
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("57");
			}
			
			


		
		
		
		return "redirect:/admin/order";
	}


}
