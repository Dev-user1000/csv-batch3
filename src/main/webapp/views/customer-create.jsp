<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>
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
            max-width: 600px;
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

        .form-section {
            padding: 30px;
        }

        .alert {
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 0.95rem;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #495057;
            font-size: 0.95rem;
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }

        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-block;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: #6c757d;
            color: white;
            margin-left: 10px;
        }

        .btn-secondary:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Customer Registration</h1>
            <p>Register new customer information</p>
        </div>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/trade-info">Trade Info</a>
            <a href="${pageContext.request.contextPath}/customer/">Customer List</a>
        </div>

        <div class="form-section">
            <c:if test="${not empty error}">
                <div class="alert alert-error">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/customer/create" method="post">
                <div class="form-group">
                    <label for="baseDate">Base Date</label>
                    <input type="text" id="baseDate" name="baseDate" placeholder="YYYY-MM-DD" required>
                </div>

                <div class="form-group">
                    <label for="customerCode">Customer Code</label>
                    <input type="text" id="customerCode" name="customerCode" placeholder="Enter customer code" required>
                </div>

                <div class="form-group">
                    <label for="customerName">Customer Name</label>
                    <input type="text" id="customerName" name="customerName" placeholder="Enter customer name" required>
                </div>

                <button type="submit" class="btn btn-primary">Create Customer</button>
                <a href="${pageContext.request.contextPath}/trade-info" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</body>
</html>
