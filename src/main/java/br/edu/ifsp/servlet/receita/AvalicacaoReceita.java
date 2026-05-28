package br.edu.ifsp.servlet.receita;

import br.edu.ifsp.Usuario;
import br.edu.ifsp.entities.Avaliacao;
import br.edu.ifsp.entities.Receita;
import br.edu.ifsp.exceptions.AcessoNegadoException;
import br.edu.ifsp.utils.GerenciadorReceita;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "Avalicacao", value = "/avaliacao")
public class AvalicacaoReceita extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String idReceitaParam = request.getParameter("id_receita");
        String notaParam = request.getParameter("nota");
        String comentario = request.getParameter("comentario");

        int idReceita;
        double nota;

        try {
            idReceita = Integer.parseInt(idReceitaParam);
            nota = Double.parseDouble(notaParam);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        Map<Integer, Receita> listaReceitas = (Map<Integer, Receita>) getServletContext().getAttribute("listaReceitas");
        Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");
        
        try {
            if (usuarioLogado == null) {
                throw new AcessoNegadoException("Nao é permitido fazer avaliação sem estar logado");
            }
            Avaliacao avaliacao = new Avaliacao(usuarioLogado, nota, comentario);
            GerenciadorReceita gerenciadorReceita = new GerenciadorReceita();
    
            boolean avaliacaoCadastrada = gerenciadorReceita.cadastrarAvaliacao(listaReceitas, idReceita, avaliacao);
            if (!avaliacaoCadastrada) {
                response.sendRedirect(request.getContextPath() + "/404.jsp");
                return;
            }
        }catch (AcessoNegadoException e){
            throw e;
        }

        getServletContext().setAttribute("listaReceitas", listaReceitas);
        response.sendRedirect(request.getContextPath() + "/receita?id=" + idReceita);
    }
}