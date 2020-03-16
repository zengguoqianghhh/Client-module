package com.zeng.controller;

import org.eclipse.jetty.server.Connector;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.ServerConnector;
import org.eclipse.jetty.webapp.WebAppContext;

public class Bootstrap {
    /**
     * 默认端口
     */
    private static final int port = 9099;
    /**
     * 默认上下文路径
     */
    private static final String contextPath = "/";
    /**
     * 默认web根路径
     */
    private static final String webAppPath = "src/main/webapp";

    public static void main(String[] args) throws Exception {
        // 1. 创建 Server
        Server server = new Server();
        //设置在JVM退出时关闭Jetty的钩子
        //这样就可以在整个功能测试时启动一次Jetty,然后让它在JVM退出时自动关闭
        server.setStopAtShutdown(true);

        // 2. 创建 ServerConnector 对象关联 Server
        ServerConnector connector = new ServerConnector(server);

        // 2.1 设置服务端口
        connector.setPort(port);

        // 2.2 设置重用地址为 false
        //解决Windows下重复启动Jetty不报告端口冲突的问题
        //在Windows下有个Windows + Sun的connector实现的问题,reuseAddress=true时重复启动同一个端口的Jetty不会报错
        //所以必须设为false,代价是若上次退出不干净(比如有TIME_WAIT),会导致新的Jetty不能启动,但权衡之下还是应该设为False
//        connector.setReuseAddress(false);

        // 3. 将 connector 对象加载到 server 中
        server.setConnectors(new Connector[]{connector});

        // 4. 创建 WebAppContext 对象，传入 web 根目录和上下文路径
        WebAppContext ctx = new WebAppContext(webAppPath, contextPath);

        // 4.1 设置 web.xml 路径
        ctx.setDescriptor(webAppPath + "/WEB-INF/web.xml");

        // 4.2 设置项目根路径
        ctx.setResourceBase(webAppPath);

        // 4.3 设置类加载路径
        ctx.setClassLoader(Thread.currentThread().getContextClassLoader());

        // 5. 将 webAppContext 对象放入到 Server 中
        server.setHandler(ctx);

        // 6. 启动线程
        server.start();
        // 7. 将线程加入到主线程
        server.join();
    }

}
