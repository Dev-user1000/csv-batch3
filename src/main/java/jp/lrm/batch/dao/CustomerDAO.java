package jp.lrm.batch.dao;

import jakarta.ejb.Stateless;
import jakarta.persistence.*;
import jp.lrm.batch.entity.Customer;
import java.util.List;

@Stateless
public class CustomerDAO {

    @PersistenceContext(unitName = "lrmPU")
    private EntityManager em;

    public void save(Customer customer) {
        em.persist(customer);
    }

    public Customer findById(String customerCode) {
        return em.find(Customer.class, customerCode);
    }

    public List<Customer> findAll() {
        return em.createQuery("SELECT c FROM Customer c ORDER BY c.customerCode", Customer.class)
                .getResultList();
    }

    public void update(Customer customer) {
        em.merge(customer);
    }

    public void delete(String customerCode) {
        Customer customer = findById(customerCode);
        if (customer != null) {
            em.remove(customer);
        }
    }
}
