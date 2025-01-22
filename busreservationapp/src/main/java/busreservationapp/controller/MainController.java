package busreservationapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import busreservationapp.dao.BusDao;
import busreservationapp.dao.CustomerDao;
import busreservationapp.dao.TicketDao;
import busreservationapp.model.Bus;
import busreservationapp.model.Customer;
import busreservationapp.model.Ticket;

@Controller
public class MainController {
	@Autowired
	private CustomerDao customerdao;
	@Autowired
	private BusDao busdao;
	@Autowired
	private TicketDao ticketdao;
	@RequestMapping("/")
	public String home() {
			System.out.println("view page");
			return "home";
		}
	
	 // This method handles the login form submission
    @RequestMapping("/login")
    public String handleLogin(@RequestParam("username") String username, 
                              @RequestParam("password") String password, 
                              Model model) {
        String correctUsername = "admin";
        String correctPassword = "admin";

        // Check if the entered username and password match the correct ones
        if (correctUsername.equals(username) && correctPassword.equals(password)) {
            return "redirect:/dashboard";  // Redirect to dashboard on successful login
        } return "/home";
    }
		
	@RequestMapping("/dashboard")
	public String dashboard (Model m) {
		 int cust_no = (int) customerdao.getCustomerCount();
		    m.addAttribute("cust_no", cust_no);
		    int bus_no = (int) busdao.getBusCount();
		    m.addAttribute("bus_no", bus_no);
		    int booked_no = (int) ticketdao.getbookedtickets();
		    m.addAttribute("booked_no", booked_no);
		    int cancelled_no = (int) ticketdao.getcancelledtickets();
		    m.addAttribute("cancelled_no", cancelled_no);
		   
		   
		return "/dashboard";
	}
	@RequestMapping("/customer")
	public String customer(Model m) {
		List<Customer> customers = customerdao.getAllCustomer();
		System.out.println("Customers: " + customers);  
		m.addAttribute("customers", customers);
		return "/customer";
	}
	@RequestMapping("/bus")
	public String bus(Model m) {
		List<Bus> bus = busdao.getAllbus();
		System.out.println(bus);
		m.addAttribute("buses", bus);
		return "/bus";
	}
	@RequestMapping("/ticket")
	public String ticket() {
		return "/ticket";
	}
	@RequestMapping("/booked")
	public String booked(Model m) {
		List<Ticket> ticket = ticketdao.getAllTicket();
		System.out.println("ticket : " + ticket);  
		m.addAttribute("ticket", ticket);
		return "/booked";
	}
	
	 
		
	@RequestMapping(value = "/customer" , method = RequestMethod.POST)
	public Customer addcustomer(@ModelAttribute Customer customer , Model m) {
		System.out.println(customer);
		customerdao.createcustomer(customer);
		m.addAttribute("customermsg", "New Customer added successfully");
		List<Customer> customers = customerdao.getAllCustomer();
		System.out.println("Customers: " + customers);  
		m.addAttribute("customers", customers);
		return customer;
	}
	
	
	@RequestMapping(value = "/bus" , method = RequestMethod.POST)
	public String addbus(@ModelAttribute Bus bus, Model m ) {
		System.out.println(bus);
		

		if (bus.getDept_day().equals(bus.getArrival_day())) {
	       
	        int timeComparison = bus.getDept_time().compareTo(bus.getArrival_time());
	        if (timeComparison >= 0) {
	        	 m.addAttribute("error", "Invalid times: Departure time must be earlier than arrival time for the same day.");
	                List<Bus> buses = busdao.getAllbus();
	                m.addAttribute("buses", buses);
	                return "/bus"; 
	        }
	    }
			busdao.createbus(bus);
			m.addAttribute("success", "New Bus Added Successfully");
		List<Bus> buses = busdao.getAllbus();
		System.out.println(buses);
		m.addAttribute("buses", buses);
		return "/bus";
	}
	
	
	
	@RequestMapping(value = "/ticket" , method = RequestMethod.POST)
	public String addticket(@ModelAttribute Ticket ticket) {
		System.out.println(ticket);
		ticketdao.createticket(ticket);
		return "/ticket";
	}
	

	//searching  bus
	@RequestMapping(value = "/ticketbus" , method = RequestMethod.GET)
  public String getBuses(@RequestParam("source") String source,
                         @RequestParam("destination") String destination,
                         @RequestParam("date") String date,
                         Model model) {
      // Fetch the list of buses directly from the repository
      List<Bus> bus = busdao.findbus(source, destination, date);
      System.out.println("Fetched buses: " + bus);
      // Add the list of buses to the model
      model.addAttribute("bus", bus);
      // Return the name of the JSP view to render
      return "/ticket";
  }
	
	

	//populating data in the form on the ticket booking page
   @PostMapping("/populateForm")
		    public String populateForm(@RequestParam("busno") String busno,
		                               @RequestParam("type") String type,
		                               @RequestParam("date") String date,
		                               @RequestParam("dept_time") String deptTime,
		                               @RequestParam("source") String source,
		                               @RequestParam("destination") String destination,
		                               @RequestParam("price") String price,
		                               Model model) {
		        // Add the selected bus data to the model
		        model.addAttribute("busno", busno);
		        model.addAttribute("type", type);
		        model.addAttribute("date", date);
		        model.addAttribute("dept_time", deptTime);
		        model.addAttribute("source", source);
		        model.addAttribute("destination", destination);
		        model.addAttribute("price", price);
		        // Return the view containing the form
		        return "/ticket";
		}
		    
	 // for populating information into the form
	    @PostMapping("/populateFormth")
	    public String populateFormticket(@RequestParam("ticketid") int ticketid,
	                               @RequestParam("firstname") String firstname,
	                               @RequestParam("lastname") String lastname,
	                               @RequestParam("busno") int busno,
	                               @RequestParam("date") String date,
	                               @RequestParam("dept_time") String deptTime,
	                               @RequestParam("source") String source,
	                               @RequestParam("destination") String destination,
	                               @RequestParam("price") String price,
	                               @RequestParam("seats") int seats,
	                               @RequestParam("totalamount") int totalamount,
	                               @RequestParam("iscancelled") boolean iscancelled,
	                               Model model) {
	        // Add the selected bus data to the model
	    	model.addAttribute("ticketid", ticketid);
	    	model.addAttribute("firstname", firstname);
	    	model.addAttribute("lastname", lastname);
	        model.addAttribute("busno", busno);
	        model.addAttribute("date", date);
	        model.addAttribute("dept_time", deptTime);
	        model.addAttribute("source", source);
	        model.addAttribute("destination", destination);
	        model.addAttribute("price", price);
	        model.addAttribute("seats", seats);
	        model.addAttribute("totalamount", totalamount);
	        model.addAttribute("iscancelled", iscancelled);
	        // Return the view containing the form
	        return "/booked";
	}

	    //add to have a new ticket
	    @RequestMapping(value = "/bookTicket" , method = RequestMethod.POST)
		public String addticket(@ModelAttribute Ticket ticket , Model m) {
			System.out.println(ticket);
			ticketdao.createticket(ticket);
			m.addAttribute("ticketmsg", "New ticket Added Successfully");
			return "/ticket";
		}
	    
	    
	    @RequestMapping(value = "/ticketcancel/{ticketid}")
	  public String ticketcancel(@PathVariable("ticketid") int ticketid , Model m) {
		  ticketdao.cancelTicket(ticketid);	
		  List<Ticket> ticket = ticketdao.getAllTicket();
			System.out.println("ticket : " + ticket);  
			m.addAttribute("ticket", ticket);
			return "redirect:/booked";
	    	
	  }
	
	  
	 
}
