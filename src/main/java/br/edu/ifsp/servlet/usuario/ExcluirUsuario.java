package br.edu.ifsp.servlet.usuario;

import br.edu.ifsp.Usuario;
import br.edu.ifsp.entities.Receita;
import br.edu.ifsp.exceptions.AcessoNegadoException;
import br.edu.ifsp.utils.GerenciadorUsuario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ExcluirUsuario", value = "/excluir")
public class ExcluirUsuario extends HttpServlet {

    GerenciadorUsuario gerenciadorUsuario = new GerenciadorUsuario();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Map<Integer, Usuario> listaUsuarios = (HashMap<Integer, Usuario>) getServletContext().getAttribute("listaUsuarios");
        Map<Integer, Receita> listaReceitas = (HashMap<Integer, Receita>) getServletContext().getAttribute("listaReceitas");
        Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");

        try {
            int idExcluir = Integer.parseInt(request.getParameter("idExcluir"));

            Usuario usuarioExcluir = listaUsuarios.get(idExcluir);

            // verifica se o usuario existe e o exclui
            if (usuarioExcluir == null || usuarioLogado == null || usuarioExcluir.getId() != usuarioLogado.getId()){
                throw new AcessoNegadoException("Usuario sem permissao");
            }else {
                gerenciadorUsuario.excluir(listaUsuarios, listaReceitas, usuarioExcluir);
            }

        } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        } catch (AcessoNegadoException e){
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

        // remove o usuario logado
        request.getSession().removeAttribute("usuarioLogado");
        getServletContext().setAttribute("listaUsuarios", listaUsuarios);
        getServletContext().setAttribute("listaReceitas", listaReceitas);
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // code
    }
}