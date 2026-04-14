package br.edu.ifsp.servlet.usuario;

import br.edu.ifsp.Usuario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "Login", value = "/autenticar")
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email_usuario");
        String senha = request.getParameter("senha_usuario");

        String msg = null;
        String url = "/index.jsp";

        Map<Integer, Usuario> listaUsuarios = (HashMap<Integer, Usuario>) getServletContext().getAttribute("listaUsuarios");

        Usuario usuarioLogado = null;

        // procura se o usuario existe
        for (Usuario user : listaUsuarios.values()){
            if (email.equals(user.getEmail())) {
                usuarioLogado = user;
                break;
            }
        }

        if (usuarioLogado == null || !senha.equals(usuarioLogado.getSenha())){
            msg = "Email ou senha inválidos";
            url = "/login.jsp";
        }

        request.setAttribute("msg", msg);

        HttpSession sessao = request.getSession();

        sessao.setAttribute("usuarioLogado", usuarioLogado);

        getServletContext().getRequestDispatcher(url).forward(request, response);

    }

}