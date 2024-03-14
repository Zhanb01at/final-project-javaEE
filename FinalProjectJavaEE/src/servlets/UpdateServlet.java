package servlets;

import Classes.Category;
import Classes.DBManager;
import Classes.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/update")
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/news");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newsId = req.getParameter("id");
        Long id = Long.parseLong(newsId);

        String updatedTitle = req.getParameter("title");
        String updatedContent = req.getParameter("content");
        Long categoryId = Long.valueOf(req.getParameter("cat"));

        News updatedNews = new News();
        updatedNews.setId(id);
        updatedNews.setTitle(updatedTitle);
        updatedNews.setContent(updatedContent);


        Category category = new Category();
        category.setId(categoryId);
        updatedNews.setCategory(category);

        if(DBManager.updateNews(updatedNews)){
            resp.sendRedirect("/news");
        }
        else {
            resp.sendRedirect("/detailNews?id="+id+"&error");
        }
    }
}