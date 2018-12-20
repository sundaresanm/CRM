package com.luv2code.springdemo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springdemo.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	// Need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Customer> getCustomers() {

		// get the current hibernate session
		   Session currentSession = sessionFactory.getCurrentSession();
		// create a Query ... Sort by Last name
		   Query<Customer> theQuery = currentSession.createQuery("from Customer order by lastName",Customer.class);
		// Execute the query and get the result list
		   List<Customer> customers = theQuery.getResultList();
		// Return Results
		   
		return customers;
		
	}

	@Override
	public void saveCustomer(Customer theCustomer) {
		// TODO Auto-generated method stub
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		// save the customer .. 
		currentSession.saveOrUpdate(theCustomer);
	}

	@Override
	public Customer getCustomer(int theId) {
		// TODO Auto-generated method stub
		// get Hibernate Seession
		Session currentSession = sessionFactory.getCurrentSession();
		// Now retieve/read data from database using primary key
		Customer theCustomer = currentSession.get(Customer.class,theId);
		return theCustomer;
	}

	@Override
	public void deleteCustomer(int theId) {
		
		// get the current hibernate session
			Session currentSession = sessionFactory.getCurrentSession();
		// delete object with primary key
		 Query theQuery = 
				 currentSession.createQuery("delete from Customer where id=:customerId");
		 theQuery.setParameter("customerId",theId);
		 theQuery.executeUpdate();
		
	}

}
