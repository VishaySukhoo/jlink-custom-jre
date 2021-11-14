open module demo.jlink {
	requires spring.boot;
	requires spring.boot.autoconfigure;
	requires spring.web;
	requires org.apache.tomcat.embed.core;
	exports com.example.demo.jlink;
}