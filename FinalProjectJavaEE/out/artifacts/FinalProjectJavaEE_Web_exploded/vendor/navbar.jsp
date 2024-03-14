<%@ page import="Classes.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <nav class="navbar navbar-expand-lg " style="background: darkblue">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="color: white">Almaty Today</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Переключатель навигации">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <%
                        User user = (User) request.getSession().getAttribute("current");
                        if (user!=null){
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="/profile" style="color: white">Profile</a>
                    </li>
                    <%
                        }
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="/news" style="color: white">News</a>
                    </li>

                    <%
                        user = (User) request.getSession().getAttribute("current");
                        if (user!=null && user.getRole_id().equals("1")){
                    %>

                    <li class="nav-item">
                        <a class="nav-link" href="/addNews" style="color: white">Add news</a>
                    </li>

                    <%
                    }else if(user==null){
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="/login" style="color: white">Sign In</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/register" style="color: white">Register</a>
                    </li>
                    <%
                        }
                    %>

                    <%
                        if(user!=null){
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout" style="color: white">Logout</a>
                    </li>
                    <%
                        }
                    %>

                </ul>
            </div>
        </div>
    </nav>
</div>