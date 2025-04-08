<%@ page import="java.util.ArrayList, src.main.java.model.classBase.Prevision" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Depense</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f9f9f9;
      }
      form {
        max-width: 400px;
        margin: auto;
        padding: 20px;
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }
      label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
      }
      select{
        width: 100%;

      }
        
      input{
        width: 95%;
      }
      select, input {
        padding: 8px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
      }
      button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 4px;
        cursor: pointer;
      }
      button:hover {
        background-color: #0056b3;
      }
      p {
        color: red;
        font-weight: bold;
      }
    </style>
  </head>
  <body>
    <form action="addDepense" method="post">
    
      <label for="libele">Libele</label>
      <select name="id" id="libele">
       <% 
                    ArrayList<Prevision> prevs = (ArrayList<Prevision>) request.getAttribute("prevs");
                    if (prevs != null) {
                        for (Prevision prev : prevs) { %>
        <option value="<%= prev.getId() %>"><%= prev.getLibele() %></option>
        <% } }%>
      </select>
      <label for="montant">Montant</label>
      <input type="number" name="montant" id="montant" />
      <button type="submit">Ajouter</button>
    </form>
  </body>
</html>
