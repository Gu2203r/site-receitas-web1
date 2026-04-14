package br.edu.ifsp.servlet.receita;

import br.edu.ifsp.entities.Receita;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EditarReceita", value = "/editada")
public class EditarReceita extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Receita receitaEditavel = null;

        try {
            int idReceita = Integer.parseInt(request.getParameter("id"));

            List<Receita> listaReceita = (List<Receita>) getServletContext().getAttribute("listaReceitas");

            for (Receita r : listaReceita){
                if (r.getId() == idReceita){
                    receitaEditavel = r;
                    break;
                }
            }

        } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        }

        getServletContext().setAttribute("receitaEditavel", receitaEditavel);
        getServletContext().getRequestDispatcher("/editarReceita.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}