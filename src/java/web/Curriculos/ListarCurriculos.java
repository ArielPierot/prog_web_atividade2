/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.Curriculos;

import web.Disciplinas.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
@WebServlet(name = "ListarCurriculos", urlPatterns = {"/ListarCurriculos"})
public class ListarCurriculos extends HttpServlet {
    
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
        Statement statement = null;
        
        try (PrintWriter out = response.getWriter()) { 
            
            Class.forName(JDBC_DRIVER); // carrega classe de driver do banco de dados
                // estabelece conexao com o banco de dados
         
            connection = DriverManager.getConnection(DATABASE_URL, "root", "root");
             // cria Statement para consultar banco de dados
            statement = connection.createStatement();
            
            // consulta o banco de dados 
            statement.executeQuery("USE lista2;");
            ResultSet resultSet = statement.executeQuery("SELECT periodos.id, cursos.nome as curso, periodos.n_periodo, disciplinas.nome AS disciplina, periodos.tipo_disciplina FROM periodos "
                    + "LEFT JOIN disciplinas ON disciplinas.id = periodos.disciplina_id "
                    + "LEFT JOIN cursos ON cursos.id = periodos.curso_id "
                    + "ORDER BY periodos.n_periodo, disciplinas.nome;");
            JSONArray jArray = new JSONArray();
            JSONObject jsonObject = null;
            ResultSetMetaData rsmd = resultSet.getMetaData();
            int columnCount = rsmd.getColumnCount();
                        
            while(resultSet.next())
            {
                jsonObject = new JSONObject();
                for (int index = 1; index <= columnCount; index++) 
                {
                    String column = rsmd.getColumnLabel(index);
                    Object value = resultSet.getObject(column);
                    if (value == null) 
                    {
                        jsonObject.put(column, "");
                    } else if (value instanceof Integer) {
                        jsonObject.put(column, (Integer) value);
                    } else if (value instanceof String) {
                        jsonObject.put(column, (String) value);                
                    } else if (value instanceof Boolean) {
                        jsonObject.put(column, (Boolean) value);           
                    } else if (value instanceof Long) {
                        jsonObject.put(column, (Long) value);                
                    } else if (value instanceof Double) {
                        jsonObject.put(column, (Double) value);                
                    } else if (value instanceof Float) {
                        jsonObject.put(column, (Float) value);                
                    } else if (value instanceof Byte) {
                        jsonObject.put(column, (Byte) value);
                    } else if (value instanceof byte[]) {
                        jsonObject.put(column, (byte[]) value);                
                    } else {
                        throw new IllegalArgumentException("Unmappable object type: " + value.getClass());
                    }
                }
                jArray.put(jsonObject);
            };
            
            out.print(jArray);       
            
            out.close();
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
              statement.close();                                      
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
