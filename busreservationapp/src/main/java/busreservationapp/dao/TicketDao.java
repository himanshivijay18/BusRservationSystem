package busreservationapp.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import busreservationapp.model.Bus;
import busreservationapp.model.Customer;
import busreservationapp.model.Ticket;

@Component
public class TicketDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void createticket(Ticket ticket) {
		this.hibernateTemplate.save(ticket);
	}
	
	public List<Ticket> getAllTicket(){
		List<Ticket> ticket = this.hibernateTemplate.loadAll(Ticket.class);
		return ticket;
	}
	
	public List<Ticket> getticket(){
		List<Ticket> bus = this.hibernateTemplate.loadAll(Ticket.class);
		return bus;
	}
	@Transactional
	public void deleteticket(int ticketid) {
		Ticket b = this.hibernateTemplate.load(Ticket.class,ticketid);
		this.hibernateTemplate.delete(b);
	}
	
	public Ticket getticket(int ticketid) {
		return this.hibernateTemplate.get(Ticket.class, ticketid);
	}


	
		@Transactional
	    public List<Ticket> findticket(int ticketid) {
	      
			String hql = "FROM Ticket WHERE ticketid = ?0";
			return (List<Ticket>) this.hibernateTemplate.find(hql, ticketid);
	    }
		
		

		@Transactional
		public void cancelTicket(int ticketid) {
		    
		    String hql = "UPDATE Ticket  SET iscancelled = true WHERE ticketid = ?0";

		 this.hibernateTemplate.bulkUpdate(hql,ticketid);
		    
		}

		
		  
		 @Transactional
		    public long getbookedtickets() {
		      
		        String hql = "SELECT COUNT(t) FROM Ticket t WHERE t.iscancelled = false";
		        		
		      List<Long> count = (List<Long>) hibernateTemplate.find(hql);
		      return count.get(0);
		    }

		 
		 @Transactional
		    public long getcancelledtickets() {
		    
		        String hql = "SELECT COUNT(t) FROM Ticket t WHERE t.iscancelled = true";
		        List<Long> count = (List<Long>) hibernateTemplate.find(hql);
			      return count.get(0);
		    }
		
}
