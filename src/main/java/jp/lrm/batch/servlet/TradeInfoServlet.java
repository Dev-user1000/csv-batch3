package jp.lrm.batch.servlet;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jp.lrm.batch.entity.TradeInfo;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/trade-info")
public class TradeInfoServlet extends HttpServlet {

    @PersistenceContext(unitName = "lrmPU")
    private EntityManager em;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String customerCode = request.getParameter("customerCode");
        String securityCode = request.getParameter("securityCode");
        String baseDate = request.getParameter("baseDate");

        StringBuilder jpql = new StringBuilder("SELECT t FROM TradeInfo t WHERE 1=1");
        List<String> conditions = new ArrayList<>();

        if (customerCode != null && !customerCode.isEmpty()) {
            jpql.append(" AND t.customerCode = :customerCode");
            conditions.add(customerCode);
        }

        if (securityCode != null && !securityCode.isEmpty()) {
            jpql.append(" AND t.securityCode = :securityCode");
            conditions.add(securityCode);
        }

        if (baseDate != null && !baseDate.isEmpty()) {
            jpql.append(" AND t.baseDate = :baseDate");
            conditions.add(baseDate);
        }

        jpql.append(" ORDER BY t.tradeNo");

        var query = em.createQuery(jpql.toString(), TradeInfo.class);

        if (customerCode != null && !customerCode.isEmpty()) {
            query.setParameter("customerCode", customerCode);
        }

        if (securityCode != null && !securityCode.isEmpty()) {
            query.setParameter("securityCode", securityCode);
        }

        if (baseDate != null && !baseDate.isEmpty()) {
            query.setParameter("baseDate", baseDate);
        }

        List<TradeInfo> tradeInfos = query.getResultList();

        request.setAttribute("trades", tradeInfos);
        request.setAttribute("customerCode", customerCode);
        request.setAttribute("securityCode", securityCode);
        request.setAttribute("baseDate", baseDate);

        request.getRequestDispatcher("/views/trade-info.jsp").forward(request, response);
    }
}
