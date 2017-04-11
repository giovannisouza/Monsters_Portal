package br.com.monster.portal.modelDao;

import java.util.List;

import br.com.monster.portal.model.ImagemMultiple;
import br.com.monster.portal.model.Produto;

public interface ProdutoDao {
	
	List<Produto> Read();
	List<Produto> Read_publico();
	List<Produto> Read_destacado();
	Produto Find_One(Long id);
	List<Produto> Find_By_Name(String nome_prod);
	List<Produto> Find_publico(String nome_prod);
	List<Produto> Find_Many_publico(String nome_prod);
	
	void create(Produto produto, ImagemMultiple imagens);
	void update(Produto produto);
	void delete(Long id);
	void restore(Long id);
}