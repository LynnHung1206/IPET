package com.core.filter;

import com.core.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Yu-Jing
 * @create 2023/1/5 上午 10:54
 */
@WebFilter(urlPatterns = "/*")
public class HibernateFilter extends HttpFilter {
    private static final long serialVersionUID = 1L;

	@Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            // 開啟 transaction
            Transaction transaction = session.beginTransaction();
            // 如果後面還有 filter，則繼續往下走
            // TODO: 驗證使用者是正當登入進來的!
            chain.doFilter(req, res);
            // 當整個運算完成後，要返回給前台時，則會準備 commit
            transaction.commit();
        } catch (Exception e) {
            // 若 servlet 拋出異常，則 rollback
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
}
