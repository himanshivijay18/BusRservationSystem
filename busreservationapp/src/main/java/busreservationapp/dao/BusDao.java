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

@Component
public class BusDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void createbus(Bus bus) {
		this.hibernateTemplate.save(bus);
	}
	
	
	public List<Bus> getAllbus(){
		List<Bus> bus = this.hibernateTemplate.loadAll(Bus.class);
		return bus;
	}
	@Transactional
	public void deletebus(int bid) {
		Bus b = this.hibernateTemplate.load(Bus.class,bid);
		this.hibernateTemplate.delete(b);
	}
	
	public Bus getbus(int bid) {
		return this.hibernateTemplate.get(Bus.class, bid);
	}

	@Transactional
    public List<Bus> findbus(String source, String destination, String date) {
		String hql = "FROM Bus WHERE source = ?0 AND destination = ?1 AND date = ?2";
		return (List<Bus>) this.hibernateTemplate.find(hql,source,destination, date);
    }
	
	
	
	public boolean isbusnoexist(int busno) {
	    String hql = "SELECT COUNT(*) FROM Bus b WHERE b.busno = :busno";
		List<Long> count = (List<Long>) this.hibernateTemplate.find(hql, "busno" , busno);
		return count.get(0) > 0 ? true : false;
		
	}
	 
	  
		 @Transactional
		    public long getBusCount() {
		       
		        String hql = "SELECT COUNT(b) FROM Bus b";
		       List<Long> count = (List<Long>) hibernateTemplate.find(hql);
		       return count.get(0).intValue();
		    }
}
