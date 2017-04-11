package br.com.monster.portal.modelDao;

import java.util.List;

import br.com.monster.portal.model.Fornecedor;

public interface FornecedorDao {
	
	List<Fornecedor> Read();
	Fornecedor Find_One(Long id);
	
	void create(Fornecedor fornecedor);
	void update(Fornecedor fornecedor);
	void delete(Long id);
	void restore(Long id);
	
}