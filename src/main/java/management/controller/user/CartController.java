package management.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import management.dao.ICustomerDao;
import management.dao.IDetailsCartDao;
import management.dao.IProductDao;
import management.dao.ISeriDao;
import management.entity.Customer;
import management.entity.DetailsCart;
import management.entity.Product;

@Controller
@RequestMapping("/user/")
public class CartController {

	@Autowired
	private IProductDao productDao;

	@Autowired
	private ICustomerDao customerDao;

	@Autowired
	private IDetailsCartDao detailsCartDao;
	
	@Autowired
	private ISeriDao seriDao;

	@GetMapping("cart")
	public ModelAndView showPageDetailsProduct(@RequestParam(value="checkboxValues", required = false) String[] checkboxValues) {

		ModelAndView mav = new ModelAndView("user/Cart");

		Customer customer = customerDao.getCustomerById("MAKH1");
		
		double sumMoney = 0;
		
		List<DetailsCart> cart = detailsCartDao.getDetailsCartsOfCustomerYetBuy("MAKH1");
		
		for (DetailsCart detailsCart : cart) {
			
			Product product = productDao.getProductById(detailsCart.getDetailsUpdatePrice().getProduct().getId());
			
			detailsCart.setDetailsUpdatePrice(
					product.getDetailsUpdatePrices().get(product.getDetailsUpdatePrices().size() - 1));

			detailsCartDao.updateDetailsCart(detailsCart);
			
		}
		
		
		if (checkboxValues != null ) {
			for (String idCart : checkboxValues) {
				
				DetailsCart detailsCart = detailsCartDao.getDetailsCartById(Long.parseLong(idCart));
				
				sumMoney += detailsCart.getDetailsUpdatePrice().getPrice() * detailsCart.getQuantity();
				
			}
			
		} else {
			
			sumMoney = 0;
			
		}
		
		List<DetailsCart> newCart = detailsCartDao.getDetailsCartsOfCustomerYetBuy("MAKH1");

		if (newCart.size() != 0) {
			
			mav.addObject("cart", newCart);
			
			mav.addObject("NoDetailsCart", false);
			
		} else {
			
			mav.addObject("NoDetailsCart", true);
			
		}
		
		return mav;
	}
	
	@GetMapping("confirm")
	public ModelAndView confirmBuyProducts(@RequestParam(value="checkboxValues", required = false) String[] checkboxValues) {
		
		ModelAndView mav = new ModelAndView("user/Bill");
		
		Customer customer = customerDao.getCustomerById("MAKH1");
		
		double sumMoney = 0;
		
		for (String idCart : checkboxValues) {
			
			DetailsCart detailsCart = detailsCartDao.getDetailsCartById(Long.parseLong(idCart));
			
			detailsCart.setStatus(true);
			
			detailsCartDao.updateDetailsCart(detailsCart);
			
			sumMoney += detailsCart.getDetailsUpdatePrice().getPrice() * detailsCart.getQuantity();
			
		}
		
		mav.addObject("date", java.time.LocalDate.now());

		List<DetailsCart> cart = detailsCartDao.getDetailsCartsOfCustomerWasBought("MAKH1");
		
		mav.addObject("sumMoney", String.format("%.3f", sumMoney));
		
		mav.addObject("listProduct", cart);
		
		mav.addObject("customer", customer);
		
		return mav;
	}
	
	
	@GetMapping("cart/{idProduct}")
	public ModelAndView addDetailsProduct(@PathVariable(name = "idProduct", required = false) String idProduct) {
		
		ModelAndView mav = new ModelAndView("user/Cart");

		Customer customer = customerDao.getCustomerById("MAKH1");
		
		Product product = productDao.getProductById(idProduct);

		DetailsCart detailsCart = new DetailsCart();
		
		detailsCart.setQuantity(1);

		detailsCart.setDetailsUpdatePrice(
				product.getDetailsUpdatePrices().get(product.getDetailsUpdatePrices().size() - 1));

		detailsCart.setCustomer(customer);

		detailsCartDao.save(detailsCart);

		customer.getDetailsCarts().add(detailsCart);

		customerDao.update(customer);

		List<DetailsCart> cart = detailsCartDao.getDetailsCartsOfCustomerYetBuy("MAKH1");

		mav.addObject("cart", cart);

		mav.addObject("NoDetailsCart", false);
		
		return mav;
	}
	
	
	@GetMapping("/cart/remove/{idRemove}")
	public ModelAndView removeDetailsProduct(@PathVariable(name = "idRemove", required = false) Long idRemove) {
		
		ModelAndView mav = new ModelAndView("user/Cart");

		Customer customer = customerDao.getCustomerById("MAKH1");
		
		DetailsCart detailsCart = detailsCartDao.getDetailsCartById(idRemove);
		
		detailsCartDao.deteleDetailsCart(detailsCart);
		
		List<DetailsCart> cart = detailsCartDao.getDetailsCartsOfCustomerYetBuy("MAKH1");
		
		if (cart != null) {
			mav.addObject("cart", cart);
			mav.addObject("NoDetailsCart", false);
		} else {
			mav.addObject("NoDetailsCart", true);
		}
		
		return mav;
	}
	
	
	@GetMapping("/cart/remove/all")
	public ModelAndView removeAllDetailsProduct() {
		
		ModelAndView mav = new ModelAndView("user/Cart");

		Customer customer = customerDao.getCustomerById("MAKH1");
		
		List<DetailsCart> cart = detailsCartDao.getDetailsCartsOfCustomerYetBuy("MAKH1");
		
		for (DetailsCart detailsCart : cart) {
			detailsCartDao.deteleDetailsCart(detailsCart);
		}
		
		mav.addObject("NoDetailsCart", true);
		
		
		return mav;
	}
	
	@GetMapping(path = {"/cart/{idCart}/except","/cart/{idCart}/add"})
	public ModelAndView changeQuantityOfProductInDetailsProduct(HttpServletRequest request,@PathVariable(name = "idCart", required = false) Long idCart) {
		
		ModelAndView mav = new ModelAndView("user/Cart");

		Customer customer = customerDao.getCustomerById("MAKH1");
		
		String url = request.getRequestURL().toString();
		
		
		DetailsCart detailsCart = detailsCartDao.getDetailsCartById(idCart);
		
		if (url.contains("add")){
			
			long quantityOfSeri = seriDao.getQuantitySeriOfProduct(detailsCart.getDetailsUpdatePrice().getProduct().getId());
			
			detailsCart.getDetailsUpdatePrice().getPrice();
			
			if ( detailsCart.getQuantity() < quantityOfSeri) {
				
				detailsCart.setQuantity(detailsCart.getQuantity() + 1);
				
			}
			
		} else {
			
			if ( detailsCart.getQuantity() > 0) {
				
				detailsCart.setQuantity(detailsCart.getQuantity() - 1);
				
			}
			
		}
		
		detailsCartDao.updateDetailsCart(detailsCart);
		
		List<DetailsCart> cart = detailsCartDao.getDetailsCartsOfCustomerYetBuy("MAKH1");
		
		mav.addObject("cart", cart);
		
		mav.addObject("NoDetailsCart", false);
		
		return mav;
	}

}
