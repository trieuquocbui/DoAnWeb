package management.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import management.dao.IProductAdminDao;
import management.dao.IUpdatePriceDao;
import management.entity.Category;
import management.entity.DetailsUpdatePrice;
import management.entity.DetailsUpdatePricePK;
import management.entity.Product;
import management.entity.Seri;
import management.entity.Staff;

@Controller
@RequestMapping("/admin/")

public class ProductController {

	@Autowired
	private IProductAdminDao productAdminDao;

	@Autowired
	private IUpdatePriceDao updatePriceDao;

	@RequestMapping(value = "product/Add")
	public String addSP(HttpServletRequest request, ModelMap model) {
		String masp = request.getParameter("masp");
		String tensp = request.getParameter("ten");
		String hinhanhsp = request.getParameter("hinhanh");
		String mausacsp = request.getParameter("mausac");
		String hangsp = request.getParameter("hang");
//		Boolean trangthaisp = Boolean.parseBoolean(request.getParameter("trangthai"));
		String thoigianbh = request.getParameter("thoigianbh");
		String thoigianbhUnit = request.getParameter("thoigianbhUnit");
		String thoigianbhsp = thoigianbh + " " + thoigianbhUnit;
		String thoigianth = request.getParameter("thoigianth");
		String thoigianthUnit = request.getParameter("thoigianbhUnit");
		String thoigianthsp = thoigianth + " " + thoigianthUnit;
		String loaisp = request.getParameter("loaichon");
		Category loai = productAdminDao.getLoaibyId(loaisp);

		try {
			Product checkProduct = productAdminDao.getSP(masp);
			if (checkProduct != null) {
				model.addAttribute("errorMessage", "Sản phẩm đã tồn tại!");
			}

			Product product = new Product();
			product.setId(masp);
			product.setName(tensp);
			product.setImage(hinhanhsp);
			product.setColor(mausacsp);
			product.setBranch(hangsp);
			product.setStatus(true);
			product.setWarrantyPeriod(thoigianbhsp);
			product.setDeliveryTime(thoigianthsp);
			product.setCategory(loai);

			Integer temp = productAdminDao.insertProduct(product);
			if (temp != 0) {
				model.addAttribute("successMessage", "Add thành công!");
			} else {
				model.addAttribute("errorMessage", "Add thất bại!");
			}

			List<Product> productlist = productAdminDao.getAllSP();
			List<Category> categorylist = productAdminDao.getAllLoai();
			model.addAttribute("productlist", productlist);
			model.addAttribute("categorylist", categorylist);
		} catch (Exception e) {
			List<Product> productlist = productAdminDao.getAllSP();
			List<Category> categorylist = productAdminDao.getAllLoai();
			model.addAttribute("productlist", productlist);
			model.addAttribute("categorylist", categorylist);
			model.addAttribute("errorMessage", "Add thất bại!");
			return "admin/product";
		}

		return "admin/product";

	}

	@RequestMapping(value = "product/Edit")
	public String editSP(HttpServletRequest request, ModelMap model) {
		String masp = request.getParameter("masp");
		String tensp = request.getParameter("ten");
		String hinhanhsp = request.getParameter("hinhanh");
		String mausacsp = request.getParameter("mausac");
		String hangsp = request.getParameter("hang");
//		Boolean trangthaisp = Boolean.parseBoolean(request.getParameter("trangthai"));
		String thoigianbhsp = request.getParameter("thoigianbh");
		String thoigianthsp = request.getParameter("thoigianth");
		String loaisp = request.getParameter("loaichon");
		Category loai = productAdminDao.getLoaibyId(loaisp);

		try {

			Product product = productAdminDao.getSP(masp);
			product.setName(tensp);
			product.setImage(hinhanhsp);
			product.setColor(mausacsp);
			product.setBranch(hangsp);
//			product.setStatus(trangthaisp);
			product.setWarrantyPeriod(thoigianbhsp);
			product.setDeliveryTime(thoigianthsp);
			product.setCategory(loai);

			Integer temp = productAdminDao.updateProduct(product);
			if (temp != 0) {
				model.addAttribute("successMessage", "Update thành công!");
			} else {
				model.addAttribute("errorMessage", "Update thất bại!");
			}

			List<Product> productlist = productAdminDao.getAllSP();
			List<Category> categorylist = productAdminDao.getAllLoai();
			model.addAttribute("productlist", productlist);
			model.addAttribute("categorylist", categorylist);
		} catch (Exception e) {
			List<Product> productlist = productAdminDao.getAllSP();
			List<Category> categorylist = productAdminDao.getAllLoai();
			model.addAttribute("productlist", productlist);
			model.addAttribute("categorylist", categorylist);
			model.addAttribute("errorMessage", "Update thất bại!");
			return "admin/product";
		}

		return "admin/product";

	}

	@RequestMapping("product/Delete")
	public String deleteSP(HttpServletRequest request, ModelMap model) {
		String masp = request.getParameter("masp");
		Product sp = productAdminDao.getSP(masp);
		sp.setStatus(false);

		Integer temp = productAdminDao.updateProduct(sp);
		Integer temp1 = productAdminDao.updateStatusSeri(masp);
		if (temp != 0 && temp1 != 0) {
			model.addAttribute("successMessage", "Delete thành công!");
		} else {
			model.addAttribute("errorMessage", "Delete thất bại!");
		}
		List<Product> productlist = productAdminDao.getAllSP();
		List<Category> categorylist = productAdminDao.getAllLoai();
		model.addAttribute("productlist", productlist);
		model.addAttribute("categorylist", categorylist);
		return "admin/product";
	}

	@RequestMapping(value = "product/Post-Sell-SP")
	public String post_sell_SP(HttpServletRequest request, ModelMap model) throws ParseException {
		String masp = request.getParameter("masp");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String ngayapdungStr = request.getParameter("ngayapdung");
		Date ngayad = format.parse(ngayapdungStr);
		Double giasp = Double.parseDouble(request.getParameter("gia"));
		String manv = request.getParameter("manv");

		try {
			DetailsUpdatePrice pr = new DetailsUpdatePrice();
			DetailsUpdatePricePK pr1 = new DetailsUpdatePricePK();
			Product product = productAdminDao.getSP(masp);
			if (product != null) {
				System.out.println("OK");
			}
//			String manv1 = "1";
//			Staff staff = updatePriceDao.getStaff(manv1);
//			if (staff != null) {
//				System.out.println("OK1");
//			}
			pr1.setApplicableDate(ngayad);
			pr.setId(pr1);
			pr.setPrice(giasp);
			pr.setProduct(product);
//			pr.setStaff(staff);

			Integer temp = updatePriceDao.insertDetailsUpdatePrice(pr, pr1);
			if (temp != 0) {
				model.addAttribute("successMessage", "Đăng bán thành công!");
			} else {
				model.addAttribute("errorMessage", "Đăng bán thất bại!1");
			}
			List<Product> productlist = productAdminDao.getAllSP();
			List<Category> categorylist = productAdminDao.getAllLoai();
			model.addAttribute("productlist", productlist);
			model.addAttribute("categorylist", categorylist);
		} catch (Exception e) {
			List<Product> productlist = productAdminDao.getAllSP();
			List<Category> categorylist = productAdminDao.getAllLoai();
			model.addAttribute("productlist", productlist);
			model.addAttribute("categorylist", categorylist);
			model.addAttribute("errorMessage", "Đăng bán thất bại!");
			return "admin/product";
		}

		return "admin/product";
	}

	@GetMapping("product")
	public ModelAndView product(HttpServletRequest request, ModelMap model) {
		List<Product> productlist = productAdminDao.getAllSP();
		List<Category> categorylist = productAdminDao.getAllLoai();

		ModelAndView modelAndView = new ModelAndView("admin/product");
		modelAndView.addObject("productlist", productlist);
		modelAndView.addObject("categorylist", categorylist);

		return modelAndView;
	}
}
