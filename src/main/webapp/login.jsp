<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Login - Receitas</title>
    <link rel="stylesheet" href="./resources/css/style.css">
</head>
<body class="bg-login">

    <div class="container-auth">
        <div class="auth-card">
            <h2>Entrar</h2>
            <form action="autenticar" method="POST">
                <div class="input-group">
                    <label>E-mail</label>
                    <input type="email" name="email_usuario" required>
                </div>
                <div class="input-group">
                    <label>Senha</label>
                    <input type="password" name="senha_usuario" required>
                </div>
                <button type="submit" class="btn-primary">Acessar Conta</button>
            </form>
            <p style="margin-top:20px; font-size:14px;">
                Novo por aqui? <a href="cadastro.jsp" style="color:#E67E22; text-decoration:none;">Cadastre-se</a>
            </p>
        </div>
    </div>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
         <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
         <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>