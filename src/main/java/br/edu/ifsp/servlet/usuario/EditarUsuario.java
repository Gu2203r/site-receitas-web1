package br.edu.ifsp.servlet.usuario;

import br.edu.ifsp.Usuario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "EditarUsuario", value = "/logado")
public class EditarUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuarioEditavel;
        String url = "/logado.jsp";

        Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");

        try {
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));

            HashMap<Integer, Usuario> listaUsuario = (HashMap<Integer, Usuario>) getServletContext().getAttribute("listaUsuarios");

            // pega o usuario pelo ‘id’
            usuarioEditavel = listaUsuario.get(idUsuario);

        } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        }

        // verifica se o usuario existe ou se esta tentando editar informações de outro
        if (usuarioEditavel == null || !usuarioEditavel.equals(usuarioLogado)){
            url = "/index.jsp";
        }

        getServletContext().setAttribute("usuarioEditavel", usuarioEditavel);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuarioEditavel = (Usuario) getServletContext().getAttribute("usuarioEditavel");
        HashMap<Integer, Usuario> listaUsuarios = (HashMap<Integer, Usuario>) getServletContext().getAttribute("listaUsuarios");

        String novoNome = request.getParameter("nome_editavel");
        String novoEmail = request.getParameter("email_editavel");
        String novaSenha = request.getParameter("senha_editavel");

        // pega o usuario pelo ‘id’
        Usuario u = listaUsuarios.get(usuarioEditavel.getId());

        // verifica se existe e muda as informações
        if (u != null){
            u.setNome(novoNome);
            u.setEmail(novoEmail);
            // caso o usuario nao trocar a senha
            if (novaSenha != null){
                u.setSenha(novaSenha);
            }
        }

        getServletContext().setAttribute("listaUsuarios", listaUsuarios);
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}