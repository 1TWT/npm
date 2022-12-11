## JavaWeb学习

## Maven框架

![image-20221206173717654](C:\Users\田涛\AppData\Roaming\Typora\typora-user-images\image-20221206173717654.png)

```xml
// web.xml 从新配置

<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                      http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0"
         metadata-complete="true">



</web-app>
```

## TomCat 启动

```redeploy是把当前的一个项目重新部署到Tomcat服务器上（一个Web项目）
restart是Tomcat服务器的重启，服务器上可以部署很多的项目；restart的一部分效果是：把服务器上部署的所有项目重新部署一次，所以这部分效果的本质就是重新部署所有的Web项目；还有一部分效果是对Tomcat的相关配置文件进行刷新。
所以一般选择重启服务器。

```

## 基本配置

//父项目 导入基本配置

```xml
<!--      servlet 基本包  -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>4.0.1</version>
        </dependency>
        // jsp操作页面包
        <dependency>
            <groupId>javax.servlet.jsp</groupId>
            <artifactId>jsp-api</artifactId>
            <version>2.2</version>
        </dependency>

    </dependencies>
```



## 子父项目

父项目中会有：

```xml
    <modules>
        <module>servlet-01</module>
    </modules>
123
```

子项目中会有：

```xml
    <parent>
        <artifactId>javaweb-02-servlet</artifactId>
        <groupId>com.kuang</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
```

### context实现数据共享

```java
public class HelloServlet extends HttpServlet {

    //由于get或者post只是请求实现的不同的方式，可以相互调用，业务逻辑都一样；
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //ServletOutputStream outputStream = resp.getOutputStream();
        PrintWriter writer = resp.getWriter(); //响应流
        writer.print("Hello,Serlvet");
		//Context 实现不同数据共享
        ServletContext Context = this.getServletContext();
        Context.setAttribute("名字","田涛");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
```

```

```

```java
public class GetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext servletContext = this.getServletContext();
        // 页面相应 数据处理
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        String s=(String) servletContext.getAttribute("名字");
        resp.getWriter().print(s);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
```

