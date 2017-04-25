package admincontroller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

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
import DAO.PlaylistDAO;
import DAO.SingerDAO;
import DAO.SongDAO;
import entity.Category;
import entity.Country;
import entity.Playlist;
import entity.Singer;
import entity.Song;

/**
 * Servlet implementation class PlaylistAddController
 */
@WebServlet("/PlaylistAddController")
public class PlaylistAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PlaylistAddController() {
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
	@Override
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
			request.setAttribute("link", "admin/add/playlists");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
			;
		}

		// configures upload settings
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// sets memory threshold - beyond which files are stored in disk
		factory.setSizeThreshold(1024 * 1024 * 10);
		// sets temporary location to store files
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// sets maximum size of upload file
		upload.setFileSizeMax(1024 * 1024 * 15);

		// sets maximum size of request (include file + form data)
		upload.setSizeMax(1024 * 1024 * 20);

		// constructs the directory path to store upload file
		// this path is relative to application's directory
		String uploadPath = getServletContext().getRealPath("") + File.separator + "img" + File.separator + "playlist";

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
								linkImg = "/img/playlist/" + fileName;
							}
						}
					} else if (item.isFormField()) {
						param.put(item.getFieldName(), item.getString("UTF-8"));
					}
				}

				int id = PlaylistDAO.getLastID() + 1;
				String namePlaylist = (String) param.get("namePlaylist");
				String keyWord = TextFormat.createKeyWord(namePlaylist);
				String slugPlaylist = TextFormat.createSlug(keyWord, id);
				Category category = CategoryDAO.getCategoryByID(Integer.parseInt((String) param.get("category")));
				Country country = CountryDAO.getCountryBySlug((String) param.get("country"));
				String infoPlaylist = (String) param.get("infoPlaylist");
				String sing = ((String) param.get("singers"));
				List<Singer> listSinger = null;
				if (sing != null) {
					StringTokenizer st = new StringTokenizer(sing.trim(), "|");
					listSinger = SingerDAO.createListSinger(st);
				}
				String song = ((String) param.get("songs"));
				List<Song> listSong = null;
				if (song != null) {
					StringTokenizer st2 = new StringTokenizer(song.trim(), "|");
					listSong = SongDAO.createListSong(st2);
				}

				if ("".equals(linkImg))
					linkImg = "/img/playlist/no-images.png";
				Date postDate = new Date(System.currentTimeMillis());
				Playlist playlist = new Playlist(category, country, namePlaylist, keyWord, slugPlaylist, postDate, 0, 0,
						linkImg, infoPlaylist, listSong, listSinger);

				if (PlaylistDAO.insert(playlist)) {
					request.getRequestDispatcher("/admin/danhsachplaylist/"+page).forward(request, response);
					return;
				} else {
					request.setAttribute("error", "Insert false");
					request.setAttribute("link", "admin/add/playlists");
					request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
					return;
				}

			} else {
				request.setAttribute("error", "Thông tin không hợp lệ");
				request.setAttribute("link", "admin/add/playlists");
				request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			request.setAttribute("link", "admin/add/playlists");
			request.getRequestDispatcher("/admin/errorpage.jsp").forward(request, response);
		}
	}

}
