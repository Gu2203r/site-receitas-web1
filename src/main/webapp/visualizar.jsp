<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Minhas Receitas - ReceitaMaster</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body style="background: #f4f4f4;"> <nav class="navbar">
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="adicionar.jsp">Adicionar receitas</a></li>
            <li><a href="visualizar.jsp">Visualizar receitas</a></li>
        </ul>

        <div class="search-container">
            <input type="text" placeholder="Pesquisar">
            <span class="search-icon">🔍</span>
        </div>

        <ul class="nav-links">
            <li><a href="#">Sobre o sistema</a></li>
        </ul>
    </nav>

    <div class="container" style="margin-top: 40px;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
            <h2 style="color: #2b1506;">Minhas Receitas</h2>
            <a href="adicionar.jsp" class="btn-primary" style="width: auto; padding: 10px 25px;">+ Nova Receita</a>
        </div>

        <div class="table-container">
            <table class="recipe-table">
                <thead>
                    <tr>
                        <th>Nome da Receita</th>
                        <th>Categoria</th>
                        <th>Tempo</th>
                        <th style="text-align: center;">Ações</th>
                    </tr>
                </thead>

            </table>
        </div>
    </div>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
        <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
        <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>