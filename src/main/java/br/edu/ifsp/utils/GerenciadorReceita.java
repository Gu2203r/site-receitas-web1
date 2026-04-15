package br.edu.ifsp.utils;

import br.edu.ifsp.entities.Receita;
import br.edu.ifsp.entities.Avaliacao;

import java.io.File;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

public class GerenciadorReceita {

	private GerenciadorArquivo<Receita> gerenciador = new GerenciadorArquivo<>();
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

		Receita receitaRemovida = listaReceitas.remove(receita.getId());
		if (receitaRemovida == null) {
			return;
		}

		excluirImagemReceita(receitaRemovida.getFoto());

		System.out.println("Receita " + receitaRemovida.getId() + " excluida");

		gerenciador.serializar(listaReceitas, receitaPath);
	}

	public int excluirPorUsuario(Map<Integer, Receita> listaReceitas, int idUsuario) {
		if (listaReceitas == null || listaReceitas.isEmpty() || idUsuario <= 0) {
			return 0;
		}

		List<Receita> receitasParaExcluir = new ArrayList<>();
		for (Receita receita : listaReceitas.values()) {
			if (receita != null && receita.getAutor() != null && receita.getAutor().getId() == idUsuario) {
				receitasParaExcluir.add(receita);
			}
		}

		for (Receita receita : receitasParaExcluir) {
			listaReceitas.remove(receita.getId());
			excluirImagemReceita(receita.getFoto());
		}

		if (!receitasParaExcluir.isEmpty()) {
			gerenciador.serializar(listaReceitas, receitaPath);
		}

		return receitasParaExcluir.size();
	}

	public void editar(Map<Integer, Receita> listaReceitas, Receita receitaEditada) {
		if (listaReceitas == null || receitaEditada == null) {
			return;
		}

		if (!listaReceitas.containsKey(receitaEditada.getId())) {
			return;
		}

		listaReceitas.put(receitaEditada.getId(), receitaEditada);
		System.out.println("Receita " + receitaEditada.getId() + " atualizada com sucesso");

		gerenciador.serializar(listaReceitas, receitaPath);
	}

 	public boolean cadastrarAvaliacao(Map<Integer, Receita> listaReceitas, int idReceita, Avaliacao avaliacao) {
		if (listaReceitas == null || avaliacao == null) {
			return false;
		}

		Receita receita = listaReceitas.get(idReceita);
		if (receita == null) {
			return false;
		}

		receita.getAvaliacoes().add(avaliacao);
		gerenciador.serializar(listaReceitas, receitaPath);
		return true;
	}

	public List<Receita> buscarPeloNome(Map<Integer, Receita> listaReceitas, String nome) {
		List<Receita> receitasEncontradas = new ArrayList<>();

		if (listaReceitas == null || listaReceitas.isEmpty() || nome == null || nome.trim().isEmpty()) {
			return receitasEncontradas;
		}

		String nomeBuscado = nome.trim().toLowerCase();
		for (Receita receita : listaReceitas.values()) {
			if (receita == null || receita.getNome() == null) {
				continue;
			}

			String nomeReceita = receita.getNome().trim().toLowerCase();
			if (nomeReceita.equals(nomeBuscado) || nomeReceita.contains(nomeBuscado)) {
				receitasEncontradas.add(receita);
			}
		}

		return receitasEncontradas;
	}


	public List<Receita> buscarPorUsuario(Map<Integer, Receita> listaReceitas, int idUsuario) {
		List<Receita> receitasDoUsuario = new ArrayList<>();

		if (listaReceitas == null || listaReceitas.isEmpty() || idUsuario <= 0) {
			return receitasDoUsuario;
		}

		for (Receita receita : listaReceitas.values()) {
			if (receita == null || receita.getAutor() == null) {
				continue;
			}

			if (receita.getAutor().getId() == idUsuario) {
				receitasDoUsuario.add(receita);
			}
		}

		return receitasDoUsuario;
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

	public List<Receita> buscarReceitasMaisVisualizadas(Map<Integer, Receita> listaReceitas) {
		if (listaReceitas == null || listaReceitas.isEmpty()) {
			return new ArrayList<>();
		}

		List<Receita> receitasOrdenadas = new ArrayList<>(listaReceitas.values());
		receitasOrdenadas.sort(Comparator
				.comparingInt(Receita::getVisualizacoes)
				.reversed()
				.thenComparingInt(Receita::getId));

		return receitasOrdenadas;
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

	public synchronized void registrarVisualizacao(Map<Integer, Receita> listaReceitas, int idReceita) {


		for (Receita r : listaReceitas.values()) {
			if (r.getId() == idReceita) {
				r.adicionarVisualizacao();
				break;
			}
		}

		// 3. Salva a lista de volta no arquivo
		gerenciador.serializar(listaReceitas, receitaPath);
	}

	private void excluirImagemReceita(String nomeFoto) {
		if (nomeFoto == null || nomeFoto.trim().isEmpty()) {
			return;
		}

		String pastaImagens = gerenciador.getCaminhoPasta() + "imagens" + File.separator;
		File imagemReceita = new File(pastaImagens + nomeFoto);
		if (imagemReceita.exists() && !imagemReceita.delete()) {
			System.out.println("Nao foi possivel excluir a imagem da receita: " + imagemReceita.getName());
		}
	}
}
