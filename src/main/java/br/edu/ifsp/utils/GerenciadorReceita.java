package br.edu.ifsp.utils;

import br.edu.ifsp.entities.Receita;
import br.edu.ifsp.entities.Avaliacao;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

public class GerenciadorReceita {

	private GerenciadorArquivo<Receita> gerenciador = new GerenciadorArquivo();
	private String receitaPath = "receitas.ser";

	public void cadastrar(Map<Integer, Receita> listaReceitas, Receita novaReceita){

		listaReceitas.put(novaReceita.getId(), novaReceita);
		System.out.println("Receita " + novaReceita.getNome() + " " + novaReceita.getId() + " cadastrada com sucesso");

		gerenciador.serializar(listaReceitas, receitaPath);
	}

	public void excluir(Map<Integer, Receita> listaReceitas, Receita receita) {
		if (listaReceitas == null || receita == null) {
			return;
		}

		listaReceitas.remove(receita.getId());
		System.out.println("Receita " + receita.getId() + " excluida");

		gerenciador.serializar(listaReceitas, receitaPath);
	}

	public List<Receita> buscarReceitasMelhorAvaliadas(Map<Integer, Receita> listaReceitas) {
		if (listaReceitas == null || listaReceitas.isEmpty()) {
			return new ArrayList<>();
		}

		List<Receita> receitasOrdenadas = new ArrayList<>(listaReceitas.values());
		receitasOrdenadas.sort(Comparator
				.comparingDouble(this::calcularMediaAvaliacoes)
				.reversed()
				.thenComparingInt(Receita::getId));

		return receitasOrdenadas;
	}

	public Receita buscarUltimaReceitaAdicionada(Map<Integer, Receita> listaReceitas) {
		if (listaReceitas == null || listaReceitas.isEmpty()) {
			return null;
		}

		Receita ultimaReceita = null;
		for (Receita receita : listaReceitas.values()) {
			if (ultimaReceita == null || receita.getId() > ultimaReceita.getId()) {
				ultimaReceita = receita;
			}
		}

		return ultimaReceita;
	}

	private double calcularMediaAvaliacoes(Receita receita) {
		if (receita == null || receita.getAvaliacoes() == null || receita.getAvaliacoes().isEmpty()) {
			return 0.0;
		}

		double soma = 0.0;
		for (Avaliacao avaliacao : receita.getAvaliacoes()) {
			soma += avaliacao.getNota();
		}

		return soma / receita.getAvaliacoes().size();
	}

}
