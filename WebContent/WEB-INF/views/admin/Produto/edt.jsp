<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!--	Formulário de Edição Aqui !!!	-->
<!--		Formulário		-->
<form action="<c:url value="UpdateProduto"/>" method="POST" class="form-horizontal form-label-left input_mask">

<!--	Input sem ícone 	-->
<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <input type="text" name="pro_nome" class="form-control" placeholder="Nome" title="Nome" value="${ produto.pro_nome }">
</div>

<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <input type="text" name="pro_descricao" class="form-control" placeholder="Descricao" title="Descricao" value="${ produto.pro_descricao }">
</div>

<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <input type="text" name="pro_desconto" class="form-control" placeholder="Desconto" title="Desconto" value="${ produto.pro_desconto }">
</div>

<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <input type="text" name="pro_peso" class="form-control" placeholder="Peso" title="Peso" value="${ produto.pro_peso }">
</div>

<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <input type="text" name="pro_altura" class="form-control" placeholder="Altura" title="Altura" value="${ produto.pro_altura }">
</div>

<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <input type="text" name="pro_largura" class="form-control" placeholder="Largura" title="Largura" value="${ produto.pro_largura }">
</div>

<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <input type="text" name="pro_comprimento" class="form-control" placeholder="Comprimento" title="Comprimento" value="${ produto.pro_comprimento }">
</div>




<!--	Booleano	-->
<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <label>
	<input type="checkbox" name="pro_publicado" class="js-switch"   title="Produto Publicado" value="${ produto.pro_publicado "> <i class="fa fa-plus"></i> Produto Publicado ?
  </label>
</div>

<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <label>
	<input type="checkbox" name="pro_destaque" class="js-switch"   title="Produto Destaque" value="${ produto.pro_destaque "> <i class="fa fa-plus"></i> Produto Destaque ?
  </label>
</div>

<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <label>
	<input type="checkbox" name="pro_promocao" class="js-switch"   title="Promocao" value="${ produto.pro_promocao "> <i class="fa fa-plus"></i> Produto em Promoção ?
  </label>
</div>
<!--	Select com
		Relacionamento		-->
<div class="col-md-12 col-sm-12 col-xs-12 form-group">
  <select type="hidden"name="imagem.id_imagem" class="form-control">
	<option value="0">Imagem</option>
	<c:forEach var="imagem" items="${imagens}">
	  <option value="${ imagem.id_imagem }">${ imagem.ima_arquivo }</option>
	</c:forEach>
  </select>
  <!-- exemplo para facilitar pro usuário -->
  <p>Não encontrou a imagem certa? <a href="<c:url value="/imagem"/>" title="Editar Imagens">Clique aqui</a></p>
</div>

<!--	Botão de envio	-->
<div class="btn-group pull-right">
  <button type="submit" class="btn btn-sm btn-success pull-right" title="Salvar">
	<i class="glyphicon glyphicon-ok" style="font-size:12px;"></i> Salvar
  </button>
</div>
<!--							Padrões do Sistema									-->

	<input type="hidden" name="id_produto"	value="${ produto.id_produto }"/>

<!--							Propriedades de Tempo								-->

	<input type="hidden" name="created_at"	value="<fmt:formatDate value="${ pro.created_at }" pattern="yyyy/MM/dd HH:mm"/>"/>
	<c:if test="${not empty pro.deleted_at}">
		<input type="hidden" name="deleted_at"	value="<fmt:formatDate value="${ pro.deleted_at }" pattern="yyyy/MM/dd HH:mm"/>"/>
	</c:if>
	<input type="hidden" name="deleted"		value="${ pro.deleted }"/>



	<p>
	Criado em:		<strong><fmt:formatDate value="${ pro.created_at }" pattern="dd/MM/yyyy HH:mm"/></strong><br>
    Atualizado em:	<strong><fmt:formatDate value="${ pro.updated_at }" pattern="dd/MM/yyyy HH:mm"/></strong><br>
    Apagado em:		<strong><fmt:formatDate value="${ pro.deleted_at }" pattern="dd/MM/yyyy HH:mm"/></strong>
    </p>

</form>