<%@ page import="java.util.ArrayList" %>
<%@ page import="Classes.News" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.List" %>
<%@ page import="Classes.Category" %>
<%@ page import="Classes.Comment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details News</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="row">
                <%News news = (News) request.getAttribute("news");
                    if(news!=null){
                        if(user != null && user.getRole_id().equals("1")){
                %>
                <div class="col-6 mt-3">
                    <form action="/update" method="post">
                        <div class="mb-3">
                            <label class="form-label">Title</label>
                            <input type="text" class="form-control" name="title"
                                   value="<%=news.getTitle()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Content</label>
                            <textarea class="form-control" name="content" id="exampleInputPassword1"
                                      style="width: 100%; height: 40%;"> <%=news.getContent()%></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Category</label>
                            <select name="cat" class="form-select">
                                <%
                                    List<Category> categories =(List) request.getAttribute("categories");
                                    if(categories!=null){
                                        for(Category cat: categories){
                                %>
                                <option value="<%=cat.getId()%>"><%=cat.getName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <input type="hidden" class="form-control"  name="id" value="<%=news.getId()%>">
                        <button type="submit" class="btn btn-success">UPDATE NEWS</button>
                    </form>

                    <form action="/delete" method="post" style="margin-top: 20px">
                        <input type="hidden" class="form-control"  name="id" value="<%=news.getId()%>">
                        <button type="submit" class="btn btn-danger">DELETE NEWS</button>
                    </form>
                    <%}
                        else if(user!=null && user.getRole_id().equals("2")){
                    %>

                    <div class="col-12 mt-3">
                        <div class="card" style="width: 100%;">
                            <div class="card-body text-primary" style="border: blueviolet 1px solid; border-radius: 5px">
                                <h5 class="card-title"><%=news.getTitle()%></h5>
                                <p class="card-text"><%=news.getContent()%></p>
                                <p class="text-secondary"><%=news.getPost_date()%></p>
                                <p class="text-secondary"><%=news.getCategory().getName()%></p>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="container"> <%--getcomment--%>
                        <div class="row">
                            <div class="col-12">
                                    <%List<Comment> comments = (List<Comment>) request.getAttribute("comments");
                                        if(comments!=null){
                                            for(Comment n: comments){
                                    %>
                                        <div class="card mt-2" style="width: 100%;">
                                            <div class="card-body text-primary" style="border: blueviolet 1px solid; border-radius: 5px">
                                                <h5 class="card-title"><%=n.getUser().getEmail()%></h5>
                                                <p class="card-text"><%=n.getComment()%></p>
                                                <p class="text-secondary"><%=n.getPost_date()%></p>
                                            </div>
                                        </div>
                                    <%
                                            }
                                        }
                                    %>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <%if (user!=null){

                                %>
                                <form action="/comment" method="post">
                                    <div class="mb-3">
                                        <label class="form-label">Comment</label>
                                        <input type="text" class="form-control" name="comment">
                                    </div>
                                    <div class="mb-3">
                                        <input type="hidden" class="form-control" name="user_id" value="<%=user.getId()%>">
                                        <input type="hidden" class="form-control" name="news_id" value="<%=news.getId()%>">
                                    </div>
                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-success">Send comment</button>
                                    </div>
                                </form>
                                <%
                                    }
                                %>
                            </div>
                            <%
                                }
                            %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>