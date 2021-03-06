package br.com.monster.portal.auth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	  @Override
	  public boolean preHandle(HttpServletRequest request, 
	      HttpServletResponse response,
	      Object controller) throws Exception {

	      String uri = request.getRequestURI();
	      if(uri.endsWith("index")			||
	    	 uri.endsWith("Contato")		||
	    	 uri.endsWith("Cadastro")		||
	    	 uri.endsWith("CreateCliente")	||
	    	 uri.endsWith("Categoria/")		||
	    	 uri.endsWith("Produtos/")		||
	    	 uri.endsWith("Login")			||
	    	 uri.endsWith("LoginEsqueciSenha")	||
	         uri.endsWith("efetuaLogin")		|| 
	         uri.endsWith("Admin/LoginAdmin")	|| 
	         uri.endsWith("efetuaLoginAdmin")	|| 
	                   uri.contains("resources")){
	        return true;
	      }

	      if(request.getSession()
	          .getAttribute("clienteLogado") != null) {
	        return true;
	      }
	      
	      /*
	       * ---------------------------
	       * 			Admin			
	       * ---------------------------
	       */
	      
	      if(request.getSession()
	 	     .getAttribute("administradorLogado") == null 
	 	     && (
		 	     uri.endsWith("Admin/Produto")			||
		 	     uri.endsWith("Admin/Cliente")			||
		 	     uri.endsWith("Admin/Pedido")			||
		 	     uri.endsWith("Admin/Fornecedor")		||
		 	     uri.endsWith("Admin/Funcionario")		||
		 	     uri.endsWith("Admin/Marketing")		||
	 	                   uri.contains("resources")
	 	     )
	 	   ){

		      response.sendRedirect("/Monsters_Portal/Admin/LoginAdmin");
		      return false;
	 	  }

	      if(request.getSession()
	          .getAttribute("administradorLogado") != null) {
	        return true;
	      }

	      response.sendRedirect("/Monsters_Portal/Login");
	      return false;
	  }
	}
