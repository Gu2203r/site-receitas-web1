<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Adicionar Receita - ReceitaMaster</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="bg-login">

    <nav class="navbar">
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="adicionar.jsp">Adicionar receitas</a></li>
            <li><a href="perfil.jsp">Configurações pessoais</a></li>
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

    <div class="container-auth">
        <div class="auth-card" style="width: 700px; margin-top: 50px;">
            <h2>Compartilhar Nova Receita</h2>
            <form action="index.jsp" method="POST">

                <div class="input-group">
                    <label>Título da Receita</label>
                    <input type="text" placeholder="Ex: Bolo de chocolate" required>
                </div>

                <div class="row-group">
                    <div class="input-group" style="flex: 1;">
                        <label>Categoria</label>
                        <select class="custom-field"required>
                            <option>Doces</option>
                            <option>Carnes</option>
                            <option>Massas</option>
                            <option>Vegano</option>
                        </select>
                    </div>
                    <div class="input-group" style="flex: 1;">
                        <label>Tempo de Preparo (min)</label>
                        <input type="number" name="tempo" placeholder="Ex: 45" min="1" required>
                    </div>
                </div>

                <div class="input-group">
                    <label>Ingredientes</label>
                    <textarea class="custom-field textarea" rows="5" placeholder="Liste os ingredientes um por linha..."required></textarea>
                </div>

                <div class="input-group">
                    <label>Modo de Preparo</label>
                    <textarea class="custom-field textarea" rows="5" placeholder="Passo 1, Passo 2..."required></textarea>
                </div>

                <button type="submit" class="btn-primary">Publicar Receita</button>
            </form>
        </div>
    </div>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
        <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
        <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>