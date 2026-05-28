<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>${receita.nome} - La Cuisine Brasil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>

    <nav class="navbar">
        <a href="index.jsp"><div class="logo">La Cuisine Brasil</div></a>
        <form action="pesquisa" method="post" class="search-container">
            <input type="text" name="receita_busca" placeholder="Pesquisar receitas..." required>
        </form>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="receitasCadastradas.jsp">Receitas</a>
            <li><a href="SobreNos.jsp">Sobre o sistema</a></li>
            <c:if test="${usuarioLogado != null}">
                <li><a href="AdicionarReceita.jsp">Cadastrar Receita</a></li>
                <li><a href="MinhasReceitas.jsp">Minhas Receitas</a></li>
                <li><a href="logado?id_usuario=${usuarioLogado.getId()}" class="btn-nav-login">${usuarioLogado.getNome()}</a></li>
                <li><a href="logout" class="btn-nav-logout">Sair</a></li>
            </c:if>
            <c:if test="${usuarioLogado == null}">
                <li><a href="login.jsp" class="btn-nav-login">Entrar</a></li>
            </c:if>
        </ul>
    </nav>

    <main class="container">
        <article class="receita-detalhe">
            <header class="receita-header">
                <h1 class="recipe-title">${receita.nome}</h1>
                <div class="recipe-meta">
                    <span class="meta-item">⏱️ ${receita.tempoPreparo} min</span>
                    <span class="meta-item">🍽️ ${receita.rendimento}</span>
                    <span class="meta-item">🏷️ ${receita.categoria.categoria}</span>
                    <span class="meta-item">👤 ${receita.autor.nome}</span>
                </div>
            </header>

            <div class="recipe-content">
                <aside class="recipe-ingredients">
                    <h3>Ingredientes</h3>
                    <p style="white-space: pre-wrap;">${receita.ingredientes}</p>
                </aside>

                <section class="recipe-steps">
                    <h3>Modo de Preparo</h3>
                    <div class="steps-text">
                        <p>${receita.modoPreparo}</p>
                    </div>
                </section>
            </div><br>
            <hr class="divisor-comentarios">

                        <section class="recipe-comments">
                            <h3 class="comments-title">Avaliações e Comentários</h3>

                            <div class="comentario-form-container">
                                <form action="${pageContext.request.contextPath}/avaliacao" method="POST">
                                    <input type="hidden" name="id_receita" value="${receita.id}">

                                    <div class="input-group avaliacao-group">
                                        <label>Sua Avaliação</label>
                                        <select name="nota" class="custom-field select-avaliacao" required>
                                            <option value="5">(Excelente)</option>
                                            <option value="4">(Muito Bom)</option>
                                            <option value="3">(Bom)</option>
                                            <option value="2">(Regular)</option>
                                            <option value="1">(Ruim)</option>
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
                                <c:forEach var="avaliacao" items="${receita.avaliacoes}">
                                    <div class="comentario-card">
                                        <div class="comentario-header">
                                            <strong>
                                                <c:choose>
                                                    <c:when test="${avaliacao.avaliador != null}">${avaliacao.avaliador.nome}</c:when>
                                                    <c:otherwise>Visitante</c:otherwise>
                                                </c:choose>
                                            </strong>
                                            <span>${avaliacao.nota}/5</span>
                                        </div>
                                        <p>${avaliacao.comentario}</p>
                                    </div>
                                </c:forEach>

                                <c:if test="${empty receita.avaliacoes}">
                                    <div class="comentario-card">
                                        <p>Ainda nao ha avaliacoes para esta receita.</p>
                                    </div>
                                </c:if>
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