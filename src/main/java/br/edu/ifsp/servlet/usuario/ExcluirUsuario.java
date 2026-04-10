package br.edu.ifsp.servlet.usuario;

import br.edu.ifsp.Usuario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ExcluirUsuario", value = "/excluir")
public class ExcluirUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Map<Integer, Usuario> listaUsuarios = (HashMap<Integer, Usuario>) getServletContext().getAttribute("listaUsuarios");
        Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");

        try {
            int idExcluir = Integer.parseInt(request.getParameter("idExcluir"));

            Usuario usuarioExcluir = listaUsuarios.get(idExcluir);

            // verifica se o usuario existe e o exclui
            if (usuarioExcluir == null || !usuarioExcluir.equals(usuarioLogado)){
                System.out.println("Usuario nao existe, ou sem permissao");
            }else {
                listaUsuarios.remove(idExcluir);
                System.out.println("Usuario " + idExcluir + " excluido");
            }

        } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        }

        // remove o usuario logado
        request.getSession().removeAttribute("usuarioLogado");
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // code
    }
}