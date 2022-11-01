package cn.tdsmy.JPetStore.Controller;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 18:50
 * @Version 1.0
 */

@WebFilter(urlPatterns = {"/*"})
public class TypeFilter implements javax.servlet.Filter
{
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException
    {
        servletRequest.setCharacterEncoding("UTF-8");
        //servletResponse.setContentType("text/html;charset=UTF-8");

        filterChain.doFilter(servletRequest, servletResponse);
    }
}
