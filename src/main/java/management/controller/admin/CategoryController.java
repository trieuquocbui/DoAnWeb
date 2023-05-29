package management.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import management.dao.ICategoryAdminDao;
import management.entity.Category;

@Controller
@RequestMapping("/admin/")

public class CategoryController {

	@Autowired
	private ICategoryAdminDao categoryAdminDao;
	
	@RequestMapping(value = "category/Add")
	public String addDM(HttpServletRequest request, ModelMap model)  {
		String madm = request.getParameter("madm");
		String tendm = request.getParameter("ten");
//		Boolean trangthaidm = Boolean.parseBoolean(request.getParameter("trangthai"));
		String hinhanhdm = request.getParameter("hinhanh");
		
		try {

			if (categoryAdminDao.checkExistId(madm) != null) {
//				result.rejectValue("maDM", "err", "Mã danh mục đã tồn tại");			
				List<Category> categorylist = categoryAdminDao.getAllDM();		
				model.addAttribute("categorylist", categorylist);
				model.addAttribute("errorMessage", "Danh mục đã tồn tại!");
				
				return "admin/category";
		    }
			
//			if (result.hasErrors()) {
//		    	List<FieldError> errors = result.getFieldErrors();
//		    	List<Category> categorylist = categoryAdminDao.getAllDM();
//				model.addAttribute("categorylist", categorylist);
//				model.addAttribute("errorMessage", errors);
//		        return "admin/category";
//		    }
			
			Category category = new Category();
			category.setId(madm);
			category.setName(tendm);
			category.setStatus(true);
			category.setImage(hinhanhdm);

			Integer temp = categoryAdminDao.insertCategory(category);
			if (temp != 0) {
				model.addAttribute("successMessage", "Add thành công!");
			} else {
				model.addAttribute("errorMessage", "Add thất bại");
			}
			
			List<Category> categorylist = categoryAdminDao.getAllDM();		
			model.addAttribute("categorylist", categorylist);
		} catch (Exception e) {
			List<Category> categorylist = categoryAdminDao.getAllDM();
			model.addAttribute("categorylist", categorylist);
			model.addAttribute("errorMessage", "Add thất bại!1");
			return "admin/category";
		}

		return "admin/category";

	}
	
	@RequestMapping(value = "category/Edit")
	public String editDM(HttpServletRequest request, ModelMap model) {
		String madm = request.getParameter("madm");
		String tendm = request.getParameter("ten");
//		Boolean trangthaidm = Boolean.parseBoolean(request.getParameter("trangthai"));
		String hinhanhdm = request.getParameter("hinhanh");

		try {

			Category category = categoryAdminDao.getDM(madm);
			category.setName(tendm);
//			category.setStatus(trangthaidm);
			category.setImage(hinhanhdm);

			Integer temp = categoryAdminDao.updateCategory(category);
			if (temp != 0) {
				model.addAttribute("successMessage", "Update thành công");
			} else {
				model.addAttribute("errorMessage", "Update thất bại!");
			}
			
			List<Category> categorylist = categoryAdminDao.getAllDM();		
			model.addAttribute("categorylist", categorylist);
		} catch (Exception e) {
			List<Category> categorylist = categoryAdminDao.getAllDM();
			model.addAttribute("categorylist", categorylist);
			model.addAttribute("errorMessage", "Update thất bại!");
			return "admin/category";
		}

		return "admin/category";

	}

	@RequestMapping("category/Delete")
	public String deleteDM(HttpServletRequest request, ModelMap model) {
		String madm = request.getParameter("madm");
		Category dm = categoryAdminDao.getDM(madm);
		dm.setStatus(false);
		Integer temp = categoryAdminDao.updateCategory(dm);
		if (temp != 0) {
			model.addAttribute("successMessage", "Delete thành công");
		} else {
			model.addAttribute("errorMessage", "Delete thất bại!");
		}
		List<Category> categorylist = categoryAdminDao.getAllDM();
		model.addAttribute("categorylist", categorylist);
		return "admin/category";
	}

	@GetMapping("category")
	public ModelAndView product(HttpServletRequest request, ModelMap model) {
		List<Category> categorylist = categoryAdminDao.getAllDM();

		ModelAndView modelAndView = new ModelAndView("admin/category");
		modelAndView.addObject("categorylist", categorylist);
		return modelAndView;
	}
}
