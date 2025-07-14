<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product Review API</title>
  <style>
    :root {
      --primary: #2c3e50;
      --accent: #2980b9;
      --light: #f4f4f4;
      --gray: #e0e0e0;
      --highlight: #ecf0f1;
      --text: #333;
      --box-bg: #e8f7ff;
    }

    * {
      box-sizing: border-box;
    }

    body, html {
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
      background-color: var(--light);
      color: var(--text);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    header {
      background-color: var(--accent);
      padding: 1.5rem;
      text-align: center;
      color: white;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h1 {
      margin: 0;
      font-size: 2rem;
    }

    .form-section {
      background-color: white;
      margin: 2rem auto;
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.05);
      max-width: 600px;
      width: 90%;
    }

    .form-section label {
      font-weight: 600;
      margin-bottom: 0.5rem;
      display: block;
    }

    .form-section select,
    .form-section input[type="submit"] {
      width: 100%;
      padding: 0.75rem;
      margin-top: 0.5rem;
      font-size: 1rem;
      border: 1px solid var(--gray);
      border-radius: 8px;
      margin-bottom: 1rem;
    }

    .form-section input[type="submit"] {
      background-color: var(--accent);
      color: white;
      font-weight: bold;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .form-section input[type="submit"]:hover {
      background-color: #1c6ea4;
    }

    .box-section {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 1.5rem;
      padding: 2rem;
      max-width: 1100px;
      margin: 0 auto 2rem;
    }

    .box {
      background-color: var(--box-bg);
      padding: 1.5rem;
      border-radius: 12px;
      text-align: left;
      font-weight: normal;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
      transition: transform 0.2s ease;
    }

    .box:hover {
      transform: translateY(-5px);
    }

    .box h3 {
      margin: 0 0 0.5rem 0;
      font-size: 1.2rem;
      color: var(--primary);
    }

    .box p {
      margin: 0.4rem 0;
    }

    .stars {
      color: #f1c40f;
    }

    @media (max-width: 480px) {
      .form-section {
        padding: 1.5rem;
      }
    }
  </style>
</head>
<body>

  <header>
    <h1>Product Review API</h1>
  </header>

  <section class="form-section">
    <form method="post" action="index">
      <label for="category">Select Category:</label>
      <select name="category" id="category" required>
        <option value="smartphone">Smartphone</option>
        <option value="movies">Movies</option>
      </select>

      <label for="rating">Select Rating:</label>
      <select name="rating" id="rating" required>
        <option value="5">5 ★</option>
        <option value="4">4 ★</option>
        <option value="3">3 ★</option>
        <option value="2">2 ★</option>
        <option value="1">1 ★</option>
      </select>

      <input type="submit" value="Show Reviews">
    </form>
  </section>

  <section class="box-section">
    <c:forEach var="review" items="${reviews}">
      <div class="box">
        <h3>${review.title}</h3>
        <p><strong>Owner:</strong> ${review.owner}</p>
        <p><strong>Manufacture Date:</strong> ${review.manufactureDate}</p>
        <p><strong>Rating:</strong> 
          <span class="stars">
            <c:forEach var="i" begin="1" end="${review.rating}">★</c:forEach>
          </span>
        </p>
      </div>
    </c:forEach>
  </section>

</body>
</html>
