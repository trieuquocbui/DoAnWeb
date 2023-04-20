package management.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.ls.LSOutput;

import management.bean.DetailReceipt;
import management.dao.IReceiptDao;
import management.entity.Product;
import management.entity.Receipt;
import management.entity.Supplier;

@Controller
@RequestMapping("/admin/")
public class ReceiptController {
	

	
	
	
	
	@Autowired
	private IReceiptDao receiptDao;
	
	// Buộc ngày hiện tại vào ngày nhập
		@ModelAttribute("ngaynhap")
		public String get_Dateimport()
		{
			return receiptDao.getCurrentDate();
		}
		
		// Buộc DS NCC
		@ModelAttribute("suppliers")
		public List<Supplier> get_ListNCC()
		{
			List<Supplier> suppliers= receiptDao.getAllSupplier();
			return  suppliers;
		}
		
		// Buộc DS Sản Phẩm
		@ModelAttribute("products")
		public List<Product> getAlProducts()
		{
			List<Product> products= receiptDao.getAllProduct();
			return  products;
		}
		
	// Trả về giao diện tạo phiếu nhập
	@RequestMapping("add-receipt")
	public String addReceipt(ModelMap modelMap) {
		modelMap.addAttribute("success", "");
		return "admin/addReceipt";
	}
	
	// Xử lí khi tạo phiếu nhập
	@RequestMapping(value = "add-receipt", method=RequestMethod.POST)
	public ModelAndView submitForm( 
				@RequestParam("importDate") String ngaynhap, 
				@RequestParam("supplier") String mancc,
				@RequestParam("id") String id,
				@RequestParam("name") String name,
				@RequestParam("soluong") int soluong,
				@RequestParam("gia") int gia) {
		ModelAndView modelAndView = new ModelAndView("admin/addReceipt");
		
		try {
			Receipt receipt = new Receipt();
			receipt.setId("PN"+receiptDao.getNumberOfReceipt());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date date = simpleDateFormat.parse(ngaynhap);
			receipt.setImportDate(date);
			receipt.setSupplier(receiptDao.findById(mancc));
			System.out.println(id);
		} catch (Exception e) {
			modelAndView.addObject("success","Lỗi!");
		}		
		return modelAndView;				
	}
	
	
}
