<%@ page import="java.util.ArrayList" %>
<%@ page import="Classes.News" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div class="container">
    <div style="text-align: center; padding-top: 30px">
        <h2 style="color: #000c8b">Welcome to the ALMATY TODAY website</h2>
        <p style="color: #2b56e2">Website with all the news about Almaty</p>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="row">
                <%
                    List<News> news  = (List<News>) request.getAttribute("news");
                    if(news!=null){
                        for(News n: news){
                %>
                <div class="col-6 mt-3">
                    <div class="card" style="width: 100%;">
                        <div class="card-body text-primary" style="border: blueviolet 1px solid; border-radius: 5px">
                            <h5 class="card-title"><%=n.getTitle()%></h5>
                            <pre class="card-text"><%=n.getContent()%></pre>
                            <p class="text-secondary"><%=n.getPost_date()%></p>
                            <p class="text-secondary"><%=n.getCategory().getName()%></p>
                            <a href="/detailsNews?id=<%=n.getId()%>" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>