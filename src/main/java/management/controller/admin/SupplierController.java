package management.controller.admin;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import management.dao.ISupplierDao;
import management.entity.Customer;
import management.entity.Supplier;

@Controller
@RequestMapping("/admin/")
public class SupplierController {
	@Autowired
	private ISupplierDao iSupplierDao;

	// Trả về giao diện: Thêm Nhà Cung Cấp
	@RequestMapping("add-supplier")
	public String addSupplier(ModelMap modelMap) {
		modelMap.addAttribute("success", "");
		return "admin/addSupplier";
	}

	// Xử lí khi thêm nhà cung cấp
	@RequestMapping(value = "add-supplier", method = RequestMethod.POST)
	public String submitForm(ModelMap modelMap, @RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber, @RequestParam("address") String address) {
		try {

			Supplier supplier = new Supplier();
			supplier.setId("NCC"+iSupplierDao.getNumberOfCustomer());
			supplier.setName(name);
			supplier.setPhoneNumber(phoneNumber);
			supplier.setAddress(address);
			if (iSupplierDao.addSupplier(supplier)) {
				modelMap.addAttribute("success", "Thêm Nhà Cung Cấp Thành Công");
			} else {
				modelMap.addAttribute("success", "Lỗi cơ sở dữ liệu!");
			}
		} catch (Exception e) {
			modelMap.addAttribute("success", "Lỗi cơ sở dữ liệu!");
		}
		return "admin/addSupplier";
	}


	// Trả về view: DS NCC
		@RequestMapping("listsupplier")
		public String getList_Customer( ModelMap map)
		{	
			 map.addAttribute("suppliers",iSupplierDao.get_ListSupplier());
			 System.out.println(iSupplierDao.get_ListSupplier().size());
			return "admin/list_Supplier";
		}
	
}
