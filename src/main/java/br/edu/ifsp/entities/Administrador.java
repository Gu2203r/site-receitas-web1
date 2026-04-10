package br.edu.ifsp.entities;

import br.edu.ifsp.Usuario;

public class Administrador extends Usuario {
    public Administrador(String nome, String senha, String email, String tipo){
        super(nome, senha, email, tipo);
    }
}
