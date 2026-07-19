package jp.lrm.batch.servlet;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jp.lrm.batch.dao.CustomerDAO;
import jp.lrm.batch.entity.Customer;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer/*")
public class CustomerServlet extends HttpServlet {

    @Inject
    private CustomerDAO customerDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // List all customers
            List<Customer> customers = customerDAO.findAll();
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("/views/customer-list.jsp").forward(request, response);
        } else if (pathInfo.equals("/create")) {
            // Show create form
            request.getRequestDispatcher("/views/customer-create.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String pathInfo = request.getPathInfo();

        if (pathInfo != null && pathInfo.equals("/create")) {
            // Create new customer
            String baseDate = request.getParameter("baseDate");
            String customerCode = request.getParameter("customerCode");
            String customerName = request.getParameter("customerName");

            if (baseDate != null && customerCode != null && customerName != null) {
                Customer customer = new Customer(baseDate, customerCode, customerName);
                try {
                    customerDAO.save(customer);
                    response.sendRedirect(request.getContextPath() + "/customer/");
                } catch (Exception e) {
                    request.setAttribute("error", "Failed to create customer: " + e.getMessage());
                    request.getRequestDispatcher("/views/customer-create.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/views/customer-create.jsp").forward(request, response);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
