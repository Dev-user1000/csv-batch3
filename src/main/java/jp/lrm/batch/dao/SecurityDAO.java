package jp.lrm.batch.dao;

import jakarta.ejb.Stateless;
import jakarta.persistence.*;
import jp.lrm.batch.entity.Security;
import java.util.List;

@Stateless
public class SecurityDAO {

    @PersistenceContext(unitName = "lrmPU")
    private EntityManager em;

    public void save(Security security) {
        em.persist(security);
    }

    public Security findById(String securityCode) {
        return em.find(Security.class, securityCode);
    }

    public List<Security> findAll() {
        return em.createQuery("SELECT s FROM Security s ORDER BY s.securityCode", Security.class)
                .getResultList();
    }

    public void update(Security security) {
        em.merge(security);
    }

    public void delete(String securityCode) {
        Security security = findById(securityCode);
        if (security != null) {
            em.remove(security);
        }
    }
}
