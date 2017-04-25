package admincontroller;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import DAO.CategoryDAO;
import DAO.CountryDAO;
import DAO.SingerDAO;
import entity.Category;
import entity.Country;
import entity.Singer;
import processor.SlugProcessor;

/**
 * Servlet implementation class SingerUpdateController
 */
@WebServlet("/SingerUpdateController")
public class SingerUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// location to store file uploaded
	private static final String UPLOAD_DIRECTORY = "img/singer";

	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 10;
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 20;
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 40;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SingerUpdateController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		int page = 1;
		if (request.getAttribute("currentPage") != null)
			page = (Integer) request.getAttribute("currentPage");
		request.setAttribute("page", page);
		request.setAttribute("currentPage", page);
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("error", "Error: Form must has enctype=multipart/form-data.");
			request.setAttribute("link", "admin/update/singer/"+SlugProcessor.getParam(request.getRequestURI()));
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);;
		}

		// configures upload settings
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// sets memory threshold - beyond which files are stored in disk
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// sets temporary location to store files
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// sets maximum size of upload file
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// sets maximum size of request (include file + form data)
		upload.setSizeMax(MAX_REQUEST_SIZE);
		upload.setHeaderEncoding(request.getCharacterEncoding());

		// constructs the directory path to store upload file
		// this path is relative to application's directory
		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

		// creates the directory if it does not exist
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		try {
			// parses the request's content to extract file data
			List<FileItem> items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			Hashtable param = new Hashtable<>();
			String linkImg = "";
			if (items != null && items.size() > 0) {
				// iterates over form's fields
				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();
					// processes only fields that are not form fields
					if (!item.isFormField()) {
						if (item.getName() != null && !"".equals(item.getName())) {
							String fileName = new File(item.getName()).getName();
							if (fileName != null) {
								String filePath = uploadPath + File.separator + fileName;
								File storeFile = new File(filePath);
								// saves the file on disk
								item.write(storeFile);
								linkImg = "/img/singer/" + fileName;
							}
						}
					} else if (item.isFormField()) {
						param.put(item.getFieldName(), item.getString("UTF-8"));
					}
				}
			}
			int id = SingerDAO.getLastID() + 1;
			String nameSinger = (String) param.get("nameSinger");
			String keyWord = TextFormat.createKeyWord(nameSinger);
			String slugSinger = TextFormat.createSlug(keyWord, id);
			Country country = CountryDAO.getCountryBySlug((String) param.get("country"));
			Category category = CategoryDAO.getCategoryBySlug((String) param.get("category"));
			String infoSinger = (String) param.get("infoSinger");
			if ("".equals(linkImg))
				linkImg = "/img/singer/no-images.png";
			Singer singer = new Singer(id, category, country, nameSinger, keyWord, slugSinger, infoSinger, linkImg, 0,
					null, null, null, null);
			if (SingerDAO.insert(singer)) {
				request.getRequestDispatcher("/admin/danhsachnghesi/"+page).forward(request, response);;
			} else {
				request.setAttribute("error", "Insert false");
				request.setAttribute("link", "admin/update/singer/"+SlugProcessor.getParam(request.getRequestURI()));
				request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);;
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e);
			request.setAttribute("link", "admin/update/singer/"+SlugProcessor.getParam(request.getRequestURI()));
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);;
		}
	}

}
