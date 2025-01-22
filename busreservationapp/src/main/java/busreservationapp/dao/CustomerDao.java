	package busreservationapp.dao;
import org.hibernate.Query;


import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import busreservationapp.model.Bus;
import busreservationapp.model.Customer;
import org.hibernate.Query;
import org.hibernate.Query;
import org.hibernate.Query;

@Component
public class CustomerDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void createcustomer(Customer customer) {
		this.hibernateTemplate.save(customer);
	}
	
	
	public List<Customer> getAllCustomer(){
		List<Customer> customer = this.hibernateTemplate.loadAll(Customer.class);
		return customer;
	}
	@Transactional
	public void deleteCustomer(int cid) {
		Customer c = this.hibernateTemplate.load(Customer.class,cid);
		this.hibernateTemplate.delete(c);
	}
	
	public Customer getCustomer(int cid) {
		return this.hibernateTemplate.get(Customer.class, cid);
	}
	

	
		  
		 @Transactional
		    public long getCustomerCount() {
		       
		        String hql = "SELECT COUNT(*) FROM Customer";
		      List<Long> result = (List<Long>) hibernateTemplate.find(hql);
		        return result.get(0).intValue();
		    }
		  }
