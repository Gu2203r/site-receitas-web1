<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro - ReceitaMaster</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="bg-cadastro">

    <div class="container-auth">
        <div class="auth-card">

            <h2>Criar Conta</h2>

            <c:if test="${not empty msgRegistro}">
                <div class="message-error">
                    ${msgRegistro}
                </div>
            </c:if>

            <form action="cadastrar" method="POST">
                <div class="input-group">
                    <label>Nome Completo</label>
                    <input type="text" name="cadastro_nome" placeholder="Nome Completo" required>
                </div>

                <div class="input-group">
                    <label>E-mail</label>
                    <input type="email" name="cadastro_email" placeholder="eu@gmail.com" required>
                </div>

                <div class="input-group">
                    <label>Senha</label>
                    <input type="password" name="cadastro_senha" placeholder="Crie uma senha forte" required>
                </div>

                <button type="submit" class="btn-primary">Finalizar Cadastro</button>
            </form>

            <p style="margin-top:20px; font-size:14px;">
                Já tem uma conta? <a href="login.jsp" style="color:#E67E22; text-decoration:none; font-weight:bold;">Entrar</a>
            </p>
             <a href="index.jsp" class="btn-voltar">
                <span class="icon-seta">←</span>
                <span>Voltar para a Home</span>
             </a>
        </div>
    </div>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
         <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
         <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>