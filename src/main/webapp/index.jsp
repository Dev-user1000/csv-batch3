<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSV Batch 3 - Home</title>
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
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
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

        .content {
            padding: 40px;
        }

        .menu-item {
            display: block;
            padding: 20px 30px;
            margin: 15px 0;
            background: #f8f9fa;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            text-decoration: none;
            color: #495057;
            font-size: 1.1rem;
            font-weight: 500;
            transition: all 0.3s;
        }

        .menu-item:hover {
            background: #667eea;
            color: white;
            border-color: #667eea;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .menu-item strong {
            display: block;
            margin-bottom: 5px;
            font-size: 1.2rem;
        }

        .menu-item span {
            font-size: 0.9rem;
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>CSV Batch 3</h1>
            <p>Jakarta EE Application for Trade Info and Customer Management</p>
        </div>

        <div class="content">
            <a href="${pageContext.request.contextPath}/trade-info" class="menu-item">
                <strong>Trade Info Viewer</strong>
                <span>View and filter trade information</span>
            </a>

            <a href="${pageContext.request.contextPath}/customer/" class="menu-item">
                <strong>Customer List</strong>
                <span>View all registered customers</span>
            </a>

            <a href="${pageContext.request.contextPath}/customer/create" class="menu-item">
                <strong>Customer Registration</strong>
                <span>Create new customer records</span>
            </a>
        </div>
    </div>
</body>
</html>
