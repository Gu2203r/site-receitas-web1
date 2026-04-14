package br.edu.ifsp.servlet.inicializador;

import br.edu.ifsp.utils.GerenciadorArquivo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "imagem", value = "/imagem")
public class imagem extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Pega o nome da foto que o HTML está pedindo
        String nomeFoto = request.getParameter("nome");
        GerenciadorArquivo gerenciadorArquivo = new GerenciadorArquivo();

        // 2. Monta o caminho seguro onde as fotos estão escondidas
        String pastaImagens = gerenciadorArquivo.getCaminhoPasta() + "imagens" + File.separator;
        File arquivoImagem = new File(pastaImagens + nomeFoto);

        // 3. Verifica se a imagem realmente existe lá
        if (!arquivoImagem.exists()) {
            // Se não achar a foto, manda o erro 404
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // 4. Descobre se é um JPG, PNG, etc., e avisa o navegador
        String mimeType = getServletContext().getMimeType(arquivoImagem.getName());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }
        response.setContentType(mimeType);
        response.setContentLength((int) arquivoImagem.length());

        // 5. Copia os bytes da foto do disco rígido e joga na tela do navegador!
        try (FileInputStream in = new FileInputStream(arquivoImagem);
             OutputStream out = response.getOutputStream()) {

            byte[] buffer = new byte[4096];
            int bytesLidos;
            while ((bytesLidos = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesLidos);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // code
    }
}