package management.controller.admin;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import management.bean.BasePath;
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
	public String addSP(HttpServletRequest request, ModelMap model, @RequestParam("file") MultipartFile file,
			@RequestParam("anhGoc") String anhGoc) {
//		HttpSession session = request.getSession();
//		Object userObj = session.getAttribute("user");
//		
//		if (userObj == null) {
//	        return "login";
//	    }
		String masp = request.getParameter("masp");
		String tensp = request.getParameter("ten");
		String mausacsp = request.getParameter("mausac");
		String chatlieusp = request.getParameter("chatlieu");
		String kichthuocsp = request.getParameter("kichthuoc");
		String hangsp = request.getParameter("hang");
		String motasp = request.getParameter("mota");
		Boolean uvsp = Boolean.parseBoolean(request.getParameter("uv"));
		Boolean greensp = Boolean.parseBoolean(request.getParameter("green"));
		Boolean altercolorsp = Boolean.parseBoolean(request.getParameter("altercolor"));
//		Boolean trangthaisp = Boolean.parseBoolean(request.getParameter("trangthai"));
		Integer thoigianbhsp = Integer.parseInt(request.getParameter("thoigianbh"));
		Integer thoigianthsp = Integer.parseInt(request.getParameter("thoigianth"));
		String loaisp = request.getParameter("loaichon");
		Category loai = productAdminDao.getLoaibyId(loaisp);

		try {
			Product checkProduct = productAdminDao.getSP(masp);
			if (checkProduct != null) {
				model.addAttribute("errorMessage", "Sản phẩm đã tồn tại!");
				List<Product> productlist = productAdminDao.getAllSP();
				List<Category> categorylist = productAdminDao.getAllLoai();
				model.addAttribute("productlist", productlist);
				model.addAttribute("categorylist", categorylist);
				return "admin/product";
			}

			if (!file.isEmpty()) {
				BasePath bPath = new BasePath();
				String path = bPath.getPathImgProduct() + masp + ".jpg";
				System.out.println("Upload ảnh: " + file.getOriginalFilename() + " thành công");
				file.transferTo(new File(path));
				anhGoc = masp + ".jpg";
				Thread.sleep(5000);
				System.out.println(path);
			}

			Product product = new Product();
			product.setId(masp);
			product.setName(tensp);
			product.setColor(mausacsp);
			product.setBranch(hangsp);
			product.setDescription(motasp);
			product.setStatus(true);
			product.setMaterial(chatlieusp);
			product.setSize(kichthuocsp);
			product.setWarrantyPeriod(thoigianbhsp);
			product.setDeliveryTime(thoigianthsp);
			product.setCategory(loai);

			Integer temp = productAdminDao.insertProduct(product);
			if (temp != 0) {
				model.addAttribute("successMessage", "Thêm thành công!");
			} else {
				model.addAttribute("errorMessage", "Thêm thất bại!");
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
			model.addAttribute("errorMessage", "Lỗi: Thêm thất bại!");
			return "admin/product";
		}

		return "admin/product";

	}

	@RequestMapping(value = "product/Edit")
	public String editSP(HttpServletRequest request, ModelMap model, @RequestParam("file") MultipartFile file,
			@RequestParam("anhGoc") String anhGoc) {
//		HttpSession session = request.getSession();
//		Object userObj = session.getAttribute("user");
//		
//		if (userObj == null) {
//	        return "login";
//	    }
		String masp = request.getParameter("masp");
		String tensp = request.getParameter("ten");
		String mausacsp = request.getParameter("mausac");
		String chatlieusp = request.getParameter("chatlieu");
		String kichthuocsp = request.getParameter("kichthuoc");
		String hangsp = request.getParameter("hang");
		String motasp = request.getParameter("mota");
//		Boolean trangthaisp = Boolean.parseBoolean(request.getParameter("trangthai"));
		Integer thoigianbhsp = Integer.parseInt(request.getParameter("thoigianbh"));
		Integer thoigianthsp = Integer.parseInt(request.getParameter("thoigianth"));
		String loaisp = request.getParameter("loaichon");
		Category loai = productAdminDao.getLoaibyId(loaisp);

		try {
			if (!file.isEmpty()) {
				BasePath bPath = new BasePath();
				String path = bPath.getPathImgProduct() + masp + ".jpg";
				System.out.println("Upload ảnh: " + file.getOriginalFilename() + " thành công");
				file.transferTo(new File(path));
				anhGoc = masp + ".jpg";
				Thread.sleep(5000);
				System.out.println(path);
			}

			Product product = productAdminDao.getSP(masp);
			product.setName(tensp);
			product.setColor(mausacsp);
			product.setBranch(hangsp);
			product.setDescription(motasp);
			product.setMaterial(chatlieusp);
			product.setSize(kichthuocsp);
//			product.setStatus(trangthaisp);
			product.setWarrantyPeriod(thoigianbhsp);
			product.setDeliveryTime(thoigianthsp);
			product.setCategory(loai);
			Integer temp = productAdminDao.updateProduct(product);
			if (temp != 0) {
				model.addAttribute("successMessage", "Cập nhật thành công!");
			} else {
				model.addAttribute("errorMessage", "Cập nhật thất bại!");
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
			model.addAttribute("errorMessage", "Lỗi: Cập nhật thất bại!");
			return "admin/product";
		}

		return "admin/product";

	}

	@RequestMapping("product/Delete")
	public String deleteSP(HttpServletRequest request, ModelMap model) {
//		HttpSession session = request.getSession();
//		Object userObj = session.getAttribute("user");
//		
//		if (userObj == null) {
//	        return "login";
//	    }
		String masp = request.getParameter("masp");
		Product sp = productAdminDao.getSP(masp);
		sp.setStatus(false);

		Integer temp = productAdminDao.updateProduct(sp);
		Integer temp1 = productAdminDao.updateStatusSeri(masp);
		if (temp != 0) {
			model.addAttribute("successMessage", "Xóa thành công!");
		} else {
			model.addAttribute("errorMessage", "Xóa thất bại!");
		}
		List<Product> productlist = productAdminDao.getAllSP();
		List<Category> categorylist = productAdminDao.getAllLoai();
		model.addAttribute("productlist", productlist);
		model.addAttribute("categorylist", categorylist);
		return "admin/product";
	}

	@RequestMapping(value = "product/Post-Sell-SP")
	public String post_sell_SP(HttpServletRequest request, ModelMap model) throws ParseException {
//		HttpSession session = request.getSession();
//		Object userObj = session.getAttribute("user");
//		
//		if (userObj == null) {
//	        return "login";
//	    }
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
			model.addAttribute("errorMessage", "Lỗi: Đăng bán thất bại!");
			return "admin/product";
		}

		return "admin/product";
	}

	@GetMapping("product")
	public ModelAndView product(HttpServletRequest request, ModelMap model) {
//		HttpSession session = request.getSession();
//		Object userObj = session.getAttribute("user");
//		
//		if (userObj == null) {
//	        return new ModelAndView("login");
//	    }
		List<Product> productlist = productAdminDao.getAllSP();
		model.addAttribute("productAdminDao", productAdminDao);
		List<Category> categorylist = productAdminDao.getAllLoai();

		ModelAndView modelAndView = new ModelAndView("admin/product");
		modelAndView.addObject("productlist", productlist);
		modelAndView.addObject("categorylist", categorylist);
		modelAndView.addObject("productAdminDao", productAdminDao);

		return modelAndView;
	}
}
