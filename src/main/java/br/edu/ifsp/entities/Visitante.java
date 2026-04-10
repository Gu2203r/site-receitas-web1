package br.edu.ifsp.entities;

import br.edu.ifsp.Usuario;

public class Visitante extends Usuario {

    public Visitante(String nome, String senha, String email, String tipo){
        super(nome, senha, email, tipo);
    }
}
