<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Prevision</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f9;
      }
      form {
        max-width: 400px;
        margin: 0 auto;
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
      input {
        width: 95%;
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
    </style>
  </head>
  <body>
    <form action="addPrevision" method="post">
      <label for="libele">Libele</label>
      <input type="text" name="libele" id="libele" />
      <label for="montant">Montant</label>
      <input type="number" name="montant" id="montant" />
      <button type="submit">Ajouter</button>
    </form>
  </body>
</html>
