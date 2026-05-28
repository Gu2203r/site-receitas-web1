package br.edu.ifsp.servlet.receita;

import br.edu.ifsp.Usuario;
import br.edu.ifsp.entities.Receita;
import br.edu.ifsp.enums.Categoria;
import br.edu.ifsp.exceptions.AcessoNegadoException;
import br.edu.ifsp.utils.GerenciadorArquivo;
import br.edu.ifsp.utils.GerenciadorReceita;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "EditarReceita", value = "/editada")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10
)
public class EditarReceita extends HttpServlet {

    private final GerenciadorReceita gerenciadorReceita = new GerenciadorReceita();
    private final GerenciadorArquivo<Receita> gerenciadorArquivo = new GerenciadorArquivo<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/editarReceita.jsp";
        Receita receitaEditavel = null;
        Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");

        try {
            int idReceita = Integer.parseInt(request.getParameter("id"));
            Map<Integer, Receita> listaReceitas = (Map<Integer, Receita>) getServletContext().getAttribute("listaReceitas");

            if (listaReceitas != null) {
                receitaEditavel = listaReceitas.get(idReceita);
            }

            if (receitaEditavel == null) {
                url = "/404.jsp";
            }

            if (receitaEditavel != null && (usuarioLogado == null || receitaEditavel.getAutor() == null || receitaEditavel.getAutor().getId() != usuarioLogado.getId())) {
                throw new AcessoNegadoException("Acesso negado, voce nao pode editar a receita de outro usuario");
            }
        } catch (NumberFormatException e) {
            url = "/404.jsp";
        } catch (AcessoNegadoException e) {
            throw e;
        }

        getServletContext().setAttribute("receitaEditavel", receitaEditavel);
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String url = "/index.jsp";
        Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");

        try {
            Map<Integer, Receita> listaReceitas = (Map<Integer, Receita>) getServletContext().getAttribute("listaReceitas");

            Receita receitaEditavel = (Receita) getServletContext().getAttribute("receitaEditavel");

            if (receitaEditavel == null) {
                url = "/404.jsp";
                System.out.println("A receitaEditavel é nula");
            }

            if (receitaEditavel != null && (usuarioLogado == null || receitaEditavel.getAutor() == null || receitaEditavel.getAutor().getId() != usuarioLogado.getId())) {
                throw new AcessoNegadoException("Acesso negado, voce nao pode editar a receita de outro usuario");
            }

            if (receitaEditavel != null) {
                String nome = request.getParameter("nome");
                Categoria categoria = Categoria.valueOf(request.getParameter("categoria").toUpperCase());
                String tempoPreparo = request.getParameter("tempo_preparo");
                String rendimento = request.getParameter("rendimento");
                String ingredientes = request.getParameter("ingredientes");
                String modoPreparo = request.getParameter("modo_preparo");

                String fotoAtual = receitaEditavel.getFoto();
                String novaFoto = fotoAtual;
                Part fotoPart = request.getPart("foto");

                if (fotoPart != null && fotoPart.getSize() > 0) {
                    String nomeFotoOriginal = fotoPart.getSubmittedFileName();
                    int indicePonto = nomeFotoOriginal.lastIndexOf(".");

                    if (indicePonto > -1) {
                        String extensao = nomeFotoOriginal.substring(indicePonto);
                        novaFoto = UUID.randomUUID() + extensao;

                        String pastaImagens = gerenciadorArquivo.getCaminhoPasta() + "imagens" + File.separator;
                        File diretorio = new File(pastaImagens);
                        if (!diretorio.exists()) {
                            diretorio.mkdirs();
                        }

                        fotoPart.write(pastaImagens + novaFoto);

                        if (fotoAtual != null && !fotoAtual.trim().isEmpty() && !fotoAtual.equals(novaFoto)) {
                            File imagemAntiga = new File(pastaImagens + fotoAtual);
                            if (imagemAntiga.exists() && !imagemAntiga.delete()) {
                                System.out.println("Nao foi possivel excluir a imagem antiga da receita: " + imagemAntiga.getName());
                            }
                        }
                    }
                }

                receitaEditavel.setNome(nome);
                receitaEditavel.setCategoria(categoria);
                receitaEditavel.setTempoPreparo(tempoPreparo);
                receitaEditavel.setRendimento(rendimento);
                receitaEditavel.setIngredientes(ingredientes);
                receitaEditavel.setModoPreparo(modoPreparo);
                receitaEditavel.setFoto(novaFoto);

                gerenciadorReceita.editar(listaReceitas, receitaEditavel);
                getServletContext().setAttribute("listaReceitas", listaReceitas);

                request.setAttribute("receita", receitaEditavel);
                url = "/receita.jsp";
            }

        } catch (NumberFormatException e) {
            url = "/404.jsp";
        } catch (AcessoNegadoException e) {
            throw e;
        }

        request.getRequestDispatcher(url).forward(request, response);

    }
}