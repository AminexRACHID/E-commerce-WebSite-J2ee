package project;

import jakarta.servlet.ServletException;

import project.ConnectionProvider;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class addNewProductAction
 */
@MultipartConfig
@jakarta.servlet.annotation.WebServlet("/addNewProductAction")
/*@WebServlet("/addNewProductAction")*/
public class addNewProductAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewProductAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		String price=request.getParameter("price");
		String active=request.getParameter("active");

		
		System.out.println(" in do post method of add image");
		Part file=request.getPart("image");
		
		String imageFileName=file.getSubmittedFileName();
		System.out.println("selected image name"+imageFileName);
		
		String uploadPath="C:/Users/ACER/eclipse-workspace/Pfe_10/src/main/webapp/"+imageFileName;
		System.out.println("upload path:"+uploadPath);
		
		try {
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=file.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		try{

			Connection con=ConnectionProvider.getCon();
			PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?)");
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, category);
			ps.setString(4, price);
			ps.setString(5, active);		
			ps.setString(6, imageFileName);
			

			int row=ps.executeUpdate();

			if(row>0){
				System.out.println("image add into db successfully.");
			}else{
				System.out.println("failed to upload image.");
			}
			response.sendRedirect("admin/addNewProduct.jsp?msg=done");
			
		}catch(Exception e){
			response.sendRedirect("admin/addNewProduct.jsp?msg=wrong");
			System.out.println(e);
		}
	}

}