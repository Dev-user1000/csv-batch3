<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trade Info Viewer</title>
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
            max-width: 1400px;
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
            font-size: 2.5rem;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .header p {
            font-size: 1.1rem;
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

        .filter-section {
            padding: 30px;
            background: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
        }

        .filter-form {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .form-group {
            flex: 1;
            min-width: 200px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #495057;
            font-size: 0.9rem;
        }

        .form-group input {
            width: 100%;
            padding: 10px 15px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
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
            font-size: 0.85rem;
        }

        thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        th {
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.5px;
        }

        td {
            padding: 10px 15px;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Trade Info Viewer</h1>
            <p>View and filter trade information with customer and security details</p>
        </div>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/customer/create">Create Customer</a>
            <a href="${pageContext.request.contextPath}/customer/">Customer List</a>
        </div>

        <div class="filter-section">
            <form class="filter-form" action="${pageContext.request.contextPath}/trade-info" method="get">
                <div class="form-group">
                    <label for="customerCode">Customer Code</label>
                    <input type="text" id="customerCode" name="customerCode" value="${customerCode}" placeholder="Enter customer code">
                </div>
                <div class="form-group">
                    <label for="securityCode">Security Code</label>
                    <input type="text" id="securityCode" name="securityCode" value="${securityCode}" placeholder="Enter security code">
                </div>
                <div class="form-group">
                    <label for="baseDate">Base Date</label>
                    <input type="text" id="baseDate" name="baseDate" value="${baseDate}" placeholder="YYYY-MM-DD">
                </div>
                <div class="form-group" style="display: flex; align-items: flex-end;">
                    <button type="submit" class="btn btn-primary">Filter</button>
                </div>
            </form>
        </div>

        <div class="table-section">
            <div class="table-container">
                <c:choose>
                    <c:when test="${not empty trades}">
                        <table>
                            <thead>
                                <tr>
                                    <th>Trade No</th>
                                    <th>Base Date</th>
                                    <th>Customer Code</th>
                                    <th>Customer Name</th>
                                    <th>Security Code</th>
                                    <th>Security Name</th>
                                    <th>Buy/Sell</th>
                                    <th>Quantity</th>
                                    <th>Amount</th>
                                    <th>Contract Date</th>
                                    <th>Settlement Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="trade" items="${trades}">
                                    <tr>
                                        <td>${trade.tradeNo}</td>
                                        <td>${trade.baseDate}</td>
                                        <td>${trade.customerCode}</td>
                                        <td>${trade.customerName}</td>
                                        <td>${trade.securityCode}</td>
                                        <td>${trade.securityName}</td>
                                        <td>${trade.buySell}</td>
                                        <td>${trade.quantity}</td>
                                        <td>${trade.amount}</td>
                                        <td>${trade.contractDate}</td>
                                        <td>${trade.settlementDate}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-data">No trade data found.</div>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:if test="${not empty trades}">
                <div class="record-count">
                    <strong>Total Records:</strong> ${trades.size()}
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
