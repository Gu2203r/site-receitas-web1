package br.edu.ifsp.utils;

import br.edu.ifsp.Usuario;

import java.util.Map;

public class GerenciadorUsuario {

    private GerenciadorArquivo<Usuario> gerenciador = new GerenciadorArquivo();
    private String userPath = "usuarios.ser";

    public void cadastrar(Map<Integer, Usuario> listaUsuarios, Usuario novoUsuario){

        listaUsuarios.put(novoUsuario.getId(), novoUsuario);
        System.out.println("Usuario " + novoUsuario.getNome() + " " + novoUsuario.getId() + " cadastrado com sucesso");

        gerenciador.serializar(listaUsuarios, userPath);
    }

    public boolean verificarEmail(Map<Integer, Usuario> listaUsuarios, String email){
        for (Usuario user : listaUsuarios.values()){
            if (email.equals(user.getEmail())) {
                return true;
            }
        }
        return false;
    }

    public void editar(Map<Integer, Usuario> listaUsuarios, int id, String nome, String email, String senha){

        Usuario u = listaUsuarios.get(id);

        u.setNome(nome);
        u.setEmail(email);
        // caso o usuario nao trocar a senha
        if (!senha.isEmpty()){
            u.setSenha(senha);
            System.out.println("nova senha: " + senha);
        }
        gerenciador.serializar(listaUsuarios, "usuarios.ser");
    }

    public void excluir(Map<Integer, Usuario> listaUsuarios, Usuario usuario){
        listaUsuarios.remove(usuario.getId());
        System.out.println("Usuario " + usuario.getId() + " excluido");

        gerenciador.serializar(listaUsuarios, "usuarios.ser");
    }
}
