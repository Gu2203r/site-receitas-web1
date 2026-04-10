package br.edu.ifsp;

public abstract class Usuario {
    private static int idAtual = 0;

    private int id;
    private String nome;
    private String email;
    private String senha;
    private String tipo;

    public Usuario(String nome, String senha,String email, String tipo){
        this.id = ++idAtual;
        this.nome = nome;
        this.senha = senha;
        this.email = email;
        this.tipo = tipo;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getSenha() {
        return senha;
    }

    public String getEmail() {
        return email;
    }

    public String getTipo() {
        return tipo;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
