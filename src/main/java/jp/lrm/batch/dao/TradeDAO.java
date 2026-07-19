package jp.lrm.batch.dao;

import jakarta.ejb.Stateless;
import jakarta.persistence.*;
import jp.lrm.batch.entity.Trade;
import java.util.List;

@Stateless
public class TradeDAO {

    @PersistenceContext(unitName = "lrmPU")
    private EntityManager em;

    public void save(Trade trade) {
        em.persist(trade);
    }

    public Trade findById(String tradeNo) {
        return em.find(Trade.class, tradeNo);
    }

    public List<Trade> findAll() {
        return em.createQuery("SELECT t FROM Trade t ORDER BY t.tradeNo", Trade.class)
                .getResultList();
    }

    public List<Trade> findByCustomerCode(String customerCode) {
        return em.createQuery("SELECT t FROM Trade t WHERE t.customerCode = :customerCode ORDER BY t.tradeNo", Trade.class)
                .setParameter("customerCode", customerCode)
                .getResultList();
    }

    public List<Trade> findBySecurityCode(String securityCode) {
        return em.createQuery("SELECT t FROM Trade t WHERE t.securityCode = :securityCode ORDER BY t.tradeNo", Trade.class)
                .setParameter("securityCode", securityCode)
                .getResultList();
    }

    public void update(Trade trade) {
        em.merge(trade);
    }

    public void delete(String tradeNo) {
        Trade trade = findById(tradeNo);
        if (trade != null) {
            em.remove(trade);
        }
    }
}
