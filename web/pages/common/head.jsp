<%--
  Created by IntelliJ IDEA.
  User: chenchenjunjie
  Date: 2023/8/13
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>

<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" integrity="sha512-L7MWcK7FNPcwNqnLdZq86lTHYLdQqZaz5YcAgE+5cnGmlw8JT03QB2+oxL100UeB6RlzZLUxCGSS4/++mNZdxw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link  rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    pageContext.setAttribute("basePath",basePath);
%>
<base href="<%=basePath%>">

<link type="text/css" rel="stylesheet" href="static/css/utils.css">
<link type="text/css" rel="stylesheet" href="static/css/style.css">
<script src="https://kit.fontawesome.com/c6d08b317e.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="static/js/index/index.js"></script>

<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>