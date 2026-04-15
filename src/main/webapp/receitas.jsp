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
            <li><a href="index.jsp" class="btn-logout">Sair</a></li>
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
            </div><br>
            <hr class="divisor-comentarios">

                        <section class="recipe-comments">
                            <h3 class="comments-title">Avaliações e Comentários</h3>

                            <div class="comentario-form-container">
                                <form action="ComentarioServlet" method="POST">
                                    <input type="hidden" name="id_receita" value="${receita.id}">

                                    <div class="input-group avaliacao-group">
                                        <label>Sua Avaliação</label>
                                        <select name="nota" class="custom-field select-avaliacao" required>
                                            <option value="5">⭐⭐⭐⭐⭐ (Excelente)</option>
                                            <option value="4">⭐⭐⭐⭐ (Muito Bom)</option>
                                            <option value="3">⭐⭐⭐ (Bom)</option>
                                            <option value="2">⭐⭐ (Regular)</option>
                                            <option value="1">⭐ (Ruim)</option>
                                        </select>
                                    </div>

                                    <div class="input-group">
                                        <label>Seu Comentário</label>
                                        <textarea name="comentario" class="custom-field textarea field-comentario" rows="3" placeholder="Conte para a comunidade o que achou desta receita..." required></textarea>
                                    </div>

                                    <button type="submit" class="btn-primary btn-comentar">Publicar Avaliação</button>
                                </form>
                            </div>

                            <div class="comments-list">
                                <div class="comentario-card">
                                    <div class="comentario-header">
                                        <strong>Prof. Avaliador</strong>
                                        <span>⭐⭐⭐⭐⭐</span>
                                    </div>
                                    <p>Que projeto incrível! A interface está muito limpa e o sistema de receitas funciona perfeitamente. Parabéns pelo excelente trabalho no La Cuisine Brasil!</p>
                                </div>
                            </div>
                        </section>
        </article>
    </main>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
       <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
       <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>