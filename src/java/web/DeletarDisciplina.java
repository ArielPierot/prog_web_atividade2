/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Ariel Pierot
 */
@WebServlet(name = "DeletarDisciplina", urlPatterns = {"/DeletarDisciplina"})
public class DeletarDisciplina extends HttpServlet {
    
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver"; 
    static final String DATABASE_URL = "jdbc:mysql://localhost:3306/lista2?autoReconnect=true&useSSL=false&serverTimezone=UTC";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        Connection connection = null;
        PreparedStatement ps = null;
        
        int i = 0;
        
        String id = request.getParameter("id");
        PrintWriter out = response.getWriter();
        
        try { 
            
            Class.forName(JDBC_DRIVER); // carrega classe de driver do banco de dados
                // estabelece conexao com o banco de dados
         
            connection = DriverManager.getConnection(DATABASE_URL, "proesc", "proesc");
             // cria Statement para consultar banco de dados
                        
            ps = connection.prepareStatement("DELETE FROM lista2.disciplinas WHERE disciplinas.id = ?");
            ps.setString(1, id);
            
            try {
                i = ps.executeUpdate();
                connection.commit();
            } finally {
                ps.close();
                
                if(i!=0)
                {
                    out.print("{'deletado' : 'true' }");
                }
                else if(i==0)
                {
                    out.print("{'deletado' : 'false' }");
                }
            }
            
        }
        catch (SQLException | ClassNotFoundException sqlException)                                
        {                                                                  
           sqlException.printStackTrace();
           return;                                               
        }
          // fim do catch
           // fim do catch
        finally // assegura que a instruÃ§Ã£o e conexÃ£o sÃ£o fechadas adequadamente
        {                                                             
           try                                                       
           {  
              out.close();
              connection.close();                                     
           } // fim do try
           catch ( Exception exception )                              
           {                                                          
              exception.printStackTrace();                            
              return;                                       
           } // fim do catch
        } // fim do finally 

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
