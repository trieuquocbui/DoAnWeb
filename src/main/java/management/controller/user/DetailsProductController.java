package management.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import management.dao.IProductDao;
import management.dao.ISeriDao;
import management.entity.Product;

@Controller
@RequestMapping("/user/")
public class DetailsProductController {
	
	@Autowired
	private IProductDao productDao;
	
	@Autowired
	private ISeriDao seriDao;
	
	@GetMapping("product/{idProduct}")
	public ModelAndView showPageDetailsProduct(@PathVariable(name = "idProduct") String idProduct) {
		ModelAndView mav = new ModelAndView("user/DetailsProduct");
		
		Product product = productDao.getProductById(idProduct);
		
		long quantityOfProduct = seriDao.getQuantitySeriOfProduct(idProduct);
		
		mav.addObject("product", product);
		
		mav.addObject("quantity", quantityOfProduct);
		
		return mav;
	}

}
