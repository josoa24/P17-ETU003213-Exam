<%@ page import="java.util.ArrayList, src.main.java.model.classBase.Prevision" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Liste des Depenses</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

    <div class="container" style="margin-top: 50px;">
        <h1 class="text-center">Liste des Depenses</h1>

        <table class="table table-bordered table-striped">
            <thead>
                <tr class="info">
                    <th>Libele</th>
                    <th>Prevision</th>
                    <th>Depenses</th>
                    <th>Reste</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    ArrayList<Prevision> prevs = (ArrayList<Prevision>) request.getAttribute("prevs");
                    if (prevs != null) {
                        for (Prevision prev : prevs) {
                %>
                            <tr>
                                <td><%= prev.getLibele() %></td>
                                <td><%= prev.getMontant() %></td>
                                <td><%= prev.getDepense() %></td>`
                                <td><%= prev.getReste() %></td>
                            </tr>
                <% 
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
