package management.controller.user;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import management.dao.IBillDao;
import management.dao.ICustomerDao;
import management.dao.IDetailsCartDao;
import management.dao.IShipDao;
import management.entity.Bill;
import management.entity.Customer;
import management.entity.DetailsCart;
import management.entity.Ship;

@Controller
@RequestMapping("/user/bill/")
public class BillController {

	@Autowired
	private ICustomerDao customerDao;

	@Autowired
	private IBillDao billDao;

	@Autowired
	private IDetailsCartDao detailsCartDao;

	@Autowired
	private IShipDao shipDao;

	@PostMapping("confirm")
	public ModelAndView confirmBuyProducts(@RequestParam("h") String h, @RequestParam("t") String t,
			@RequestParam("sdt") String std, @RequestParam("dc") String dc, @RequestParam("nd") String note) {

		ModelAndView mav = new ModelAndView("user/ThankYou");

		Customer customer = customerDao.getCustomerById("MAKH1");

		customer.setSurname(h);
		customer.setName(t);
		customer.setPhoneNumber(std);
		customer.setAddress(dc);

		customerDao.update(customer);
		
		String address = customer.getAddress();
		
		Ship ship = new Ship();

		if (address.contains("TP Hồ Chí Minh")) {
			ship = shipDao.getShipId("HCM");
		} else if (address.contains("TP Ho Chi Minh")) {
			ship = shipDao.getShipId("HCM");
		} else if (address.contains("TP ho chi minh")) {
			ship = shipDao.getShipId("HCM");
		} else {
			ship = shipDao.getShipId("NHCM");
		}

		Bill bill = new Bill();

		bill.setShip(ship);

		bill.setStatus(0);

		bill.setApplicableDate(new Date());

		bill.setNote(note);

		int primaryKey = billDao.createBill(bill);
		
		bill  = billDao.getBillById(primaryKey);

		List<DetailsCart> cart = detailsCartDao.getDetailsCartsOfCustomerWasBought("MAKH1");

		for (DetailsCart detailsCart : cart) {
			
			detailsCart.setBill(bill);
			
			detailsCartDao.updateDetailsCart(detailsCart);
		}

		return mav;
	}

}
