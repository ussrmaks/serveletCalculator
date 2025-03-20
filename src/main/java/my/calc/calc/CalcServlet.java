package my.calc.calc;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import my.calc.calc.service.CalcController;
import my.calc.calc.service.impl.CalculatorImpl;

@WebServlet(name = "calculator", value = "/calculator")
public class CalcServlet extends HttpServlet {
    private String message;
    private CalcController calcController;

    @Override
    public void init() { calcController = new CalculatorImpl(); message = "Кулькулятор";  }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        float a=0;
        float b=0;
        float result=0;

        String s1 ="+";
        String v1,v2,v3,v4;
        if(request.getParameter("value1")!=null)  a = Float.parseFloat(request.getParameter("value1"));
        if(request.getParameter("value2")!=null) b = Float.parseFloat(request.getParameter("value2"));
        if(request.getParameter("operation")!=null) s1 = request.getParameter("operation");
        System.out.println(a);
        System.out.println(s1);
        switch (s1) {
            case "+": v1 = "checked"; v2 = ""; v3 = ""; v4 = ""; result = calcController.add(a,b); break;
            case "-": v1 = ""; v2 = "checked"; v3 = ""; v4 = ""; result = calcController.sub(a,b); break;
            case "*": v1 = ""; v2 = ""; v3 = "checked"; v4 = ""; result = calcController.mul(a,b); break;
            case "/": v1 = ""; v2 = ""; v3 = ""; v4 = "checked"; result = calcController.div(a,b); break;
            default: v1 = "checked"; v2 = ""; v3 = ""; v4 = ""; result = 0; break;
        }
        PrintWriter out = response.getWriter();

        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("<form action=\"/calculator\" method=\"GET\">");

        out.println("<table><tr><td>");

        out.println("<label for=\"value1\">Первое значение:</label></td><td>");
        out.println("<input type=\"text\" name=\"value1\" id=\"value1\" value=" + a + "></td></tr>");

        out.println("<tr><td></td><td><label for=\"plus\">+</label>");
        out.println("<input type=\"radio\" id=\"plus\" name=\"operation\" value=\"+\" " + v1 + ">");
        out.println("<label for=\"minus\">-</label>");
        out.println("<input type=\"radio\" id=\"minus\" name=\"operation\" value=\"-\" " + v2 + ">");
        out.println("<label for=\"multiply\">*</label>");
        out.println("<input type=\"radio\" id=\"multiply\" name=\"operation\" value=\"*\" " + v3 + ">");
        out.println("<label for=\"divide\">/</label>");
        out.println("<input type=\"radio\" id=\"divide\" name=\"operation\" value=\"/\" " + v4 + "></td></tr>");

        out.println("<tr><td><label for=\"value2\">Второе значение:</label></td><td>");
        out.println("<input type=\"text\" name=\"value2\" id=\"value2\" value=" + b + "></td></tr>");



        out.println("<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>");
        out.println("<tr></tr><td><label for=\"result\">Результат:</label></td><td>");
        out.println("<input type=\"text\" name=\"result\" id=\"result\" value=" + result + "></td>");



        out.println("<tr><td></td><td><input type=\"submit\" value=\"Посчитать\" name=\"fetchdata\"></td>");
        out.println("</table>");
        out.println("</form>");

        out.println("</body></html>");
    }


    @Override
    public void destroy() {
    }
}