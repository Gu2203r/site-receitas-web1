<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>${receita.titulo} - La Cuisine Brasil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>

    <nav class="navbar">
        <div class="logo">La Cuisine <span>Brasil</span></div>
        <ul class="nav-links">
            <li><a href="index.jsp">Início</a></li>
            <li><a href="visualizar.jsp">Receitas</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>
            <li><a href="login.jsp" class="btn-nav-login">Entrar</a></li>
        </ul>
    </nav>

    <main class="container">
        <article class="receita-detalhe">
            <header class="receita-header">
                <h1 class="recipe-title">${receita.titulo}</h1>
                <div class="recipe-meta">
                    <span class="meta-item">⏱️ ${receita.tempo} min</span>
                    <span class="meta-item">🍽️ ${receita.porcoes} porções</span>
                    <span class="meta-item">⭐ Favoritar</span>
                </div>
            </header>

            <div class="recipe-content">
                <aside class="recipe-ingredients">
                    <h3>Ingredientes</h3>
                    <ul>
                        <c:forEach var="ingrediente" items="${receita.listaIngredientes}">
                            <li>${ingrediente}</li>
                        </c:forEach>
                        <p style="white-space: pre-wrap;">${receita.ingredientes}</p>
                    </ul>
                </aside>

                <section class="recipe-steps">
                    <h3>Modo de Preparo</h3>
                    <div class="steps-text">
                        <p>${receita.modoPreparo}</p>
                    </div>

                    <div class="recipe-actions">
                        <button onclick="window.print()" class="btn-secondary">🖨️ Imprimir Receita</button>
                    </div>
                </section>
            </div>
        </article>
    </main>

    <footer class="main-footer">
        <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
        <p class="signature">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>