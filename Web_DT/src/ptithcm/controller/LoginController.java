package ptithcm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ptithcm.bean.Mailer;
import ptithcm.bean.MyItem;
import ptithcm.entity.Address;
import ptithcm.entity.User;
import ptithcm.service.AddressService;
import ptithcm.service.CartService;
import ptithcm.service.PermissionService;
import ptithcm.service.ReportService;
import ptithcm.service.UserService;
import ptithcm.utils.Constants;

@Controller
public class LoginController {	
	
	@Autowired
	Mailer mailer;
	
	@Autowired
	UserService userService;
	
	@Autowired
	PermissionService permissionService;
	
	@Autowired
	AddressService addressService;

	@Autowired
	CartService cartService;
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	HttpServletRequest request;
	
	@ModelAttribute("orderStatistics")
	public List<MyItem> getOrderStatistics()
	{
		return reportService.reportOrder();
	}
	
	@ModelAttribute("listOrder")
	public List<MyItem> getListOrder()
	{
		return reportService.reportReceipt(new Date(), 7);
	}
	
	@ModelAttribute("reportUser")
	public List<MyItem> reportUser()
	{
		return reportService.reportUser(new Date(), 7);
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String getLoginView(@ModelAttribute("user") User user) {
		return "account/login";
	}
	
	@RequestMapping(value="/login/{authen}", method = RequestMethod.GET)
	public String authen(ModelMap model, @ModelAttribute("user") User user, @PathVariable("authen") String authen) {
		model.addAttribute("authen", authen);
		return "account/login";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(ModelMap model, @ModelAttribute("user") User user, BindingResult errors, HttpServletRequest request, HttpSession session) {	
		
		User userLogin;
			userLogin = userService.getUserByUsername(user.getUsername());
			if (userLogin==null) {
				System.out.println("Tài khoản không tồn tại");
				model.addAttribute("message", "Tài khoản không tồn tại");
				return "account/login";
			}
			if(BCrypt.checkpw(user.getPassword(), userLogin.getPassword())) {
			//if (1==1) {
				if(userLogin.getPermission().getId() == 2) {
				//if (1==1) {
					session.setAttribute("admin", userLogin);
					return "redirect:/admin/statistics.htm";
				}
				else {				
					System.out.println("Vai trò khách hàng!");
					session.setAttribute("user", userLogin);
					session.setAttribute("cart", cartService.getCartByUserId(userLogin.getId()));
					session.setAttribute("totalItem", cartService.getTotalItem(userLogin.getId()));
					session.setAttribute("totalMoney", cartService.getTotalMoney(userLogin.getId()));
					return "redirect:/home.htm";	
				}
			}
			else {
				errors.rejectValue("password", "user", "Mật khẩu không đúng!");
				return "account/login";
			}
		}			
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		
		if(session.getAttribute("admin") != null) {
			session.removeAttribute("admin");
		}
		else {
			session.removeAttribute("user");
			session.removeAttribute("cart");
			session.removeAttribute("totalItem");
			session.removeAttribute("totalMoney");
		}
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value="/admin/statistics", method = RequestMethod.GET)
	public String admin() {
		return "admin/statistics";
	}
	
	@RequestMapping(value="/admin/listMember", method = RequestMethod.GET)
	public String member() {
		return "admin/listMember";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String getRegisterView(@ModelAttribute("user") User user) {
		
		return "account/register";
	}
	String codeSent ="";
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(HttpSession session, ModelMap model, @ModelAttribute("user") User user, BindingResult errors, @RequestParam("file") MultipartFile file) {
		if (userService.getUserByUsername(user.getUsername()) != null) {
			errors.rejectValue("username", "user", "Tên người dùng đã được sử dụng!");
		}
		if (user.getUsername().length() > 50) {
			errors.rejectValue("username", "user", "Tên người dùng không được dài quá 50 ký tự!");
		}
		if (user.getLastName().matches(".*\\d+.*")) {
			errors.rejectValue("lastName", "user", "Họ không được chứa số!");
		}
		if (user.getLastName().matches(".*[:;/{}*<>=()!.#$@_+,?-]+.*")) {
			errors.rejectValue("lastName", "user", "Họ không được chứa ký tự đặc biệt!");
		}
		if (user.getFirstName().matches(".*\\d+.*")) {
			errors.rejectValue("firstName", "user", "Tên không được chứa số!");
		}
		if (user.getFirstName().matches(".*[:;/{}*<>=()!.#$@_+,?-]+.*")) {
			errors.rejectValue("firstName", "user", "Tên không được chứa ký tự đặc biệt!");
		}
		if (user.getLastName().length() > 100) {
			errors.rejectValue("lastName", "user", "Họ không được dài quá 100 ký tự!");
		}
		if (user.getFirstName().length() > 50) {
			errors.rejectValue("firstName", "user", "Tên không được dài quá 100 ký tự!");
		}
		if (user.getEmail().length() > 100) {
			errors.rejectValue("email", "user", "Email không được dài quá 100 ký tự!");
		}
		if (userService.getUserByEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "user", "Email đã được sử dụng!");
		}
		if (!user.getPhone().matches("\\d{10,}")) {
			errors.rejectValue("phone", "user", "Số điện thoại không hợp lệ!");
		}
		if (userService.getUserByPhone(user.getPhone()) != null) {
			errors.rejectValue("phone", "user", "Số điện thoại đã được sử dụng!");
		}
		if(errors.hasErrors())
			return "account/register";
		else
		{
			codeSent = Constants.randomCode(6);

			String from = "quangtuong64@gmail.com";
			String to = user.getEmail();
			String subject = "Mã xác nhận đăng ký tài khoản DTT";
			String body = "Mã xác nhận của bạn là:  " + codeSent;

			mailer.send(from, to, subject, body, file);
			model.addAttribute("message", "Mã xác nhận đã được gửi đến hộp thư của bạn");

			Address address = addressService.getAddressById(1);
			address.setId(null);
			address.setSpecificAddress(null);
			int resultAddress = addressService.addAddress(address);
			if(resultAddress == 0) {
				model.addAttribute("message1", "Thêm địa chỉ thất bại");
				return "account/register";
			}
			int result = userService.addUser(user, address, file);
			session.setAttribute("user", userService.getUserByID(user.getId()));
			session.setAttribute("cart", cartService.getCartByUserId(user.getId()));
			session.setAttribute("totalItem", cartService.getTotalItem(user.getId()));
			session.setAttribute("totalMoney", cartService.getTotalMoney(user.getId()));
			return "account/XacNhanCode";
		}	
	}
	
	@RequestMapping(value ="XacNhanCode", method = RequestMethod.GET)
	public String XacNhanCode() {
		return "account/XacNhanCode";
	}
	
	@RequestMapping(value = "XacNhanCode", method = RequestMethod.POST)
	public String code(ModelMap model, RedirectAttributes reAttributes, HttpSession session,
			@RequestParam("email") String email,@RequestParam("username") String username, @RequestParam("code") String code) {
		if (codeSent == null || codeSent.length() == 0) {
			System.out.println("random code không tồn tại!");
			return "redirect:/home.htm";
		}
		System.out.println(codeSent + " - " + code);
		if (codeSent.equals(code)) {
			model.addAttribute("email", email);
			mailer.sendCREATEsuccessfully(email,username);
			String url = request.getServletContext().getContextPath() + "/login.htm";
			model.addAttribute("message",
					"Xác nhận tài khoản thành công. " + "Click <a href='" + url + "'>vào đây</a> để đăng nhập");
			return "account/XacNhanCode";
		}
		User user =userService.getUserByEmail(email);
		userService.deleteUser(user);
		model.addAttribute("email", email);
		model.addAttribute("message", "Mã code không chính xác!");
		
		return "account/XacNhanCode";
	}
	
}
