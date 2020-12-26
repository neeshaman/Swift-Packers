package com.SwiftPackers.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class CustomerFilter
 */
@WebFilter("/CustomerFilter")
public class CustomerFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CustomerFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        
        String loginURI = request.getContextPath() + "/admin";
        
        boolean loggedIn = session != null && session.getAttribute("isCustomer") != null;
        //boolean loginRequest = request.getRequestURI().equals(loginURI);

        if (loggedIn /*|| loginRequest*/) {
            chain.doFilter(request, response);
        } else {
            System.out.println("Invalid Access! Please login first! ");
            RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
            rs.forward(request, response);
        }
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
