<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer List</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 2rem;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .header p {
            font-size: 1rem;
            opacity: 0.9;
        }

        .nav-links {
            padding: 20px 30px;
            background: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
        }

        .nav-links a {
            display: inline-block;
            margin-right: 20px;
            text-decoration: none;
            color: #667eea;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #764ba2;
        }

        .table-section {
            padding: 30px;
        }

        .table-container {
            overflow-x: auto;
            border-radius: 8px;
            border: 1px solid #e9ecef;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9rem;
        }

        thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid #e9ecef;
        }

        tbody tr {
            transition: background-color 0.2s;
        }

        tbody tr:hover {
            background-color: #f8f9fa;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        .no-data {
            text-align: center;
            padding: 40px;
            color: #6c757d;
            font-size: 1.1rem;
        }

        .record-count {
            margin-top: 20px;
            padding: 10px 15px;
            background: #f8f9fa;
            border-radius: 4px;
            font-size: 0.9rem;
            color: #495057;
        }

        .btn {
            padding: 10px 25px;
            border: none;
            border-radius: 8px;
            font-size: 0.95rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-block;
            text-decoration: none;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Customer List</h1>
            <p>View all registered customers</p>
        </div>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/trade-info">Trade Info</a>
            <a href="${pageContext.request.contextPath}/customer/create">Create Customer</a>
        </div>

        <div class="table-section">
            <div class="table-container">
                <c:choose>
                    <c:when test="${not empty customers}">
                        <table>
                            <thead>
                                <tr>
                                    <th>Base Date</th>
                                    <th>Customer Code</th>
                                    <th>Customer Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="customer" items="${customers}">
                                    <tr>
                                        <td>${customer.baseDate}</td>
                                        <td>${customer.customerCode}</td>
                                        <td>${customer.customerName}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-data">No customers found.</div>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:if test="${not empty customers}">
                <div class="record-count">
                    <strong>Total Records:</strong> ${customers.size()}
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
