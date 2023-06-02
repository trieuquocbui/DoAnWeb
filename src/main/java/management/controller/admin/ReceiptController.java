package management.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.ls.LSOutput;

import javassist.expr.NewArray;
import management.bean.DetailReceipt;
import management.dao.IProductDao;
import management.dao.IReceiptDao;
import management.entity.Product;
import management.entity.Receipt;
import management.entity.Seri;
import management.entity.Supplier;

@Controller
@RequestMapping("/admin/")
public class ReceiptController {

	@Autowired
	private IReceiptDao receiptDao;

	@Autowired
	private IProductDao iProductDao;

	// Buộc ngày hiện tại vào ngày nhập
	@ModelAttribute("ngaynhap")
	public String get_Dateimport() {
		return receiptDao.getCurrentDate();
	}

	// Buộc DS NCC
	@ModelAttribute("suppliers")
	public List<Supplier> get_ListNCC() {
		List<Supplier> suppliers = receiptDao.getAllSupplier();
		return suppliers;
	}

	// Buộc mã phiếu nhập tự sinh
	@ModelAttribute("receipt_code")
	public Long get_MAPN() {
		System.out.println("a");
		return receiptDao.getNumberOfReceipt();
	}

	// Buộc DS Sản Phẩm
	@ModelAttribute("products")
	public List<Product> getAlProducts() {
		List<Product> products = receiptDao.getAllProduct();
		return products;
	}

	/*
	 * @ModelAttribute("detail_receipt") public DetailReceipt create_Model() {
	 * DetailReceipt detail_receipt = new DetailReceipt(); return detail_receipt; }
	 */
	// Trả về giao diện tạo phiếu nhập
	@RequestMapping("add-receipt")
	public String addReceipt(ModelMap modelMap) {
		modelMap.addAttribute("success", "");
		return "admin/addReceipt";
	}

	// Xử lí khi tạo phiếu nhập
	@RequestMapping(value = "add-receipt", method = RequestMethod.POST)
	public ModelAndView submitForm(@ModelAttribute("detail_receipt") List<DetailReceipt> detailReceipts,
			@RequestParam("ngaynhap") String ngaynhap, @RequestParam("supplier") String mancc) {

		ModelAndView modelAndView = new ModelAndView("admin/addReceipt");

		try {
			Receipt receipt = new Receipt();
			receipt.setId("PN" + receiptDao.getNumberOfReceipt());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date date = simpleDateFormat.parse(ngaynhap);
			receipt.setImportDate(date);
			receipt.setSupplier(receiptDao.findById(mancc));
			for (DetailReceipt detailReceipt : detailReceipts) {
				for (int i = 0; i < detailReceipt.getSoLuong(); i++) {
					System.out.println(i);
				}
			}
		} catch (Exception e) {
			modelAndView.addObject("success", "Lỗi!");
		}
		return modelAndView;

	}

	// Xử lý khi bấm vào nút CTPN
	
	/*
	 * @RequestMapping("detail_Receipt") public ModelAndView
	 * detail_ReceiptModelAndView(ModelMap md) { ModelAndView modelAndView = new
	 * ModelAndView("admin/detail_addReceipt");
	 * 
	 * return modelAndView;
	 * 
	 * }
	 */
	 
// Xử lí khi bấm vào nút CTPN -> sẽ lấy dữ liệu ở addPn qua CTPN
	@GetMapping("detail_Receipt")
	public String test(@RequestParam(value = "checkboxValues", required = false) List<String> selectedProducts,
			
			ModelMap md) {
		
		List<DetailReceipt> detailReceiptList = new ArrayList<>();
		
		if(selectedProducts != null) {
			for (String string : selectedProducts) {
				Product product = iProductDao.getProductById(string);
				DetailReceipt detailReceipt = new DetailReceipt();
				detailReceipt.setProduct(product);
				detailReceiptList.add(detailReceipt);
			}
			System.out.println(selectedProducts.size());
		}
		
		md.addAttribute("detail_receipt", detailReceiptList);

		return "admin/detail_addReceipt";
	}
	
	

	// Trả về giao diện thêm sản phẩm chưa có
	@RequestMapping("add-product")
	public String addProduct() {
		return "admin/addReceipt";
	}
	
	// Lưu vào database chi tiết pn
	@GetMapping("receipt/confirm")
	public String test1(@RequestParam(value = "ids", required = false) List<String> selectedProducts,
			@RequestParam(value = "listQuantity", required = false) List<String> listQuantity,
			@RequestParam(value = "listPrice", required = false) List<String> listPrice,
			@RequestParam(value = "supplier", required = false) String idSupplier,
			@RequestParam(value = "date", required = false) String date,
			ModelMap md) {
			Supplier supplier = receiptDao.getSupplierlById(idSupplier);
			System.out.println(supplier.getId());
			String receipt_codeString = receiptDao.getNumberOfReceipt().toString();
			System.out.println(receipt_codeString);
			receiptDao.createReCeipt(receipt_codeString, supplier,new Date() );
			  for(int i=0;i<selectedProducts.size();i++) {
				  for(int j=0;j<Integer.parseInt(listQuantity.get(i));j++)
				  {
					  String idString = receiptDao.getNumberOfSeri().toString();
					  Double giaDouble = Double.parseDouble(listPrice.get(i));
					  Product product = iProductDao.getProductById(selectedProducts.get(i));
					  Receipt receipt = receiptDao.getReceiptlById(receipt_codeString);
					  Seri seri = new Seri();
					  seri.setId(idString);
					  seri.setImportPrice(giaDouble);
					  seri.setProduct(product);
					  seri.setReceipt(receipt);
					  receiptDao.create_Serial(seri);
				  }
			  }
			 
		return "admin/list_Receipt";
	}
	@RequestMapping("listReceipt")
	public String getList_Receipt(Model model)
	{	
		model.addAttribute("receiptDao", receiptDao);
		return "admin/list_Receipt";
		
	}
	@ModelAttribute("receipts")
	public List<Receipt> getList_Customer()
	{	
		List<Receipt> receipts = new ArrayList<>();
		receipts= receiptDao.getListReceipt();

		return receipts;
		
	}
}
