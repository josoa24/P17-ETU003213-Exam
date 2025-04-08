<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
      background-color: #f5f5f5;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    
    .login-container {
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      padding: 40px;
      width: 400px;
      max-width: 90%;
    }
    
    .login-header {
      text-align: center;
      margin-bottom: 30px;
    }
    
    .login-header h1 {
      color: #333;
      font-size: 28px;
      margin-bottom: 10px;
    }
    
    .login-header p {
      color: #777;
      font-size: 16px;
    }
    
    .form-group {
      margin-bottom: 20px;
    }
    
    .form-group label {
      display: block;
      margin-bottom: 8px;
      color: #555;
      font-weight: 500;
    }
    
    .form-group input {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
      transition: border-color 0.3s;
    }
    
    .form-group input:focus {
      border-color: #4c84ff;
      outline: none;
    }
    
    .error-message {
      color: #e74c3c;
      font-size: 14px;
      margin-top: 5px;
      display: none;
    }
    
    .remember-forgot {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .remember-me {
      display: flex;
      align-items: center;
    }
    
    .remember-me input {
      margin-right: 8px;
    }
    
    .forgot-password {
      color: #4c84ff;
      text-decoration: none;
      font-size: 14px;
    }
    
    .forgot-password:hover {
      text-decoration: underline;
    }
    
    .login-button {
      width: 100%;
      padding: 14px;
      background-color: #4c84ff;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    
    .login-button:hover {
      background-color: #3a6fd8;
    }
    
    .signup-link {
      text-align: center;
      margin-top: 20px;
      color: #777;
      font-size: 14px;
    }
    
    .signup-link a {
      color: #4c84ff;
      text-decoration: none;
      font-weight: 500;
    }
    
    .signup-link a:hover {
      text-decoration: underline;
    }
    
    .social-login {
      margin-top: 30px;
      text-align: center;
    }
    
    .social-login p {
      color: #777;
      margin-bottom: 15px;
      position: relative;
    }
    
    .social-login p::before,
    .social-login p::after {
      content: "";
      display: inline-block;
      width: 100px;
      height: 1px;
      background-color: #ddd;
      vertical-align: middle;
      margin: 0 10px;
    }
    
    .social-icons {
      display: flex;
      justify-content: center;
      gap: 15px;
    }
    
    .social-icons button {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      border: 1px solid #ddd;
      background-color: white;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: background-color 0.3s;
    }
    
    .social-icons button:hover {
      background-color: #f5f5f5;
    }
    
    .social-icons i {
      font-size: 20px;
    }
    
    .fa-google {
      color: #DB4437;
    }
    
    .fa-facebook {
      color: #4267B2;
    }
    
    .fa-twitter {
      color: #1DA1F2;
    }
  </style>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
  <div class="login-container">
   
    <form action="auth" method="post" id="login-form">
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" value="etu003213@gmail.com">
        <p class="error-message" id="email-error">Please enter a valid email address</p>
      </div>
      
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" value="123">
        <p class="error-message" id="password-error">Password must be at least 6 characters</p>
      </div>
      
      <button type="submit" class="login-button">Login</button>
    </form>
    
</body>
</html>